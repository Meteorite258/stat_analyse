// include header file
#include "../core_header.h"

// function: 01
/**
 *  tool flow for Xilinx FPGA design netlist analysis
 * @param  design_name  name of property file
 * @return  program status
 */
int stat_lut_xilinx(char * design_name)
{
    char para_str[MAX_STR] = "\0";
    char cmd[MAX_STR] = "\0";
    unsigned long pos = 0, pos2 = 0;
    int status = SUCCESS;
    FILE *fnet = NULL, *fstat = NULL;
    extern unsigned char debug_mode; // disable debug mode by default
    extern char project_path[MAX_STR];

    if(debug_mode) program_log(0x15100100); // program log
    
    // clear outputs from previous runs
    #ifndef USING_WIN32
        strcpy(cmd, "rm -f ");
        strcat(cmd, project_path);
        strcat(cmd, "/Outputs/*.net");
        system(cmd);
    
        strcpy(cmd, "rm -f ");
        strcat(cmd, project_path);
        strcat(cmd, "/Proof/*.*");
        system(cmd);
    #else
        strcpy(cmd, "del /f ");
        strcat(cmd, project_path);
        strcat(cmd, "\\Outputs\\*.net");
        system(cmd);
    
        strcpy(cmd, "del /f ");
        strcat(cmd, project_path);
        strcat(cmd, "\\Proof\\*.*");
        system(cmd);
    #endif
    
    puts("format netlist");
    
    // format design network
    status = format_netlist_xilinx(design_name); // format design
    
    puts("format netlist done");
    
    // get .net file
    strcpy(para_str, project_path);
    strcat(para_str, "/Outputs/");
    pos2 = strlen(para_str); // end of para_str

    pos = strlen(design_name);
    while(design_name[pos] != '/') pos--; // find file name
    pos++; // beginning of Verilog file name

    while(design_name[pos] != '.'){
        para_str[pos2++] = design_name[pos++];
    }
    para_str[pos2] = '\0'; // set end of file name
    
    // open the netlist file for output
    strcat(para_str, ".net");
    
    // open design netlist file
    fnet = fopen(para_str, "r");
    if(!fnet){
        printf("%sNetlist file open error in stat_lut_xilinx()%s\n", KRED, BLUE);

        program_log(0x15100102); // program error status
        return ERR_IN;
    }

    // now open the lut stat file
    remove_extension(para_str, '.');
    strcat(para_str, ".stat");
    
    // open data list file
    fstat = fopen(para_str, "w");
    if(!fstat){
        printf("%sLUT stat file open error in stat_lut_xilinx()%s\n", KRED, BLUE);
        fclose(fnet);

        program_log(0x15100103); // program error status
        return ERR_OUT;
    }
    
    puts("init analysis now");
    
    // perform lut re-construction analysis
    rewind(fnet);
    status = init_analysis_xilinx(design_name, fnet, fstat);
    
    fclose(fnet);
    fclose(fstat);

    printf("Analysis of design file %s has completed\n", design_name);
    
    return status;
}

// function: 02
/**
 *  re-construct design netlist from simulation traces
 * @param  design_name  design name
 * @param  fnet  design netlist to get signal names
 * @param  flist  list file from QuestaSim simulation
 * @param  num_traces  the number of traces used
 * @return  program status
 */
int init_analysis_xilinx(char *design_name, FILE *fnet, FILE *fstat)
{
    char keyword[MAX_STR] = "\0", istr[MAX_STR] = "\0";
    char sig[MAX_STR] = "\0", vector[MAX_STR] = "\0";
    int i = 0, upper_width = 0, lower_width = 0, len = 0, status = SUCCESS;
    unsigned long init = 0, power = 0;
    struct RSIGNALS *rheader = NULL, *rcptr = NULL, *rnew_sig = NULL, *rsptr = NULL;
    struct RBITS *riptr = NULL, *rnew_node = NULL, *rbptr = NULL;
    struct LUNITS *lheader = NULL, *lcptr = NULL, *lnew_unit = NULL;
    struct LBITS *liptr = NULL, *lnew_sig = NULL;
    extern unsigned char debug_mode; // disable debug mode by default
    extern char project_path[MAX_STR];
    
    if(debug_mode) program_log(0x150C0900); // program log

    // begin: construct design network of signals for reconstruction analysis
    while(fscanf(fnet, "%s", keyword) != EOF){
        if(strcmp(keyword, "wire") == 0 || strcmp(keyword, "input") == 0 || strcmp(keyword, "output") == 0){
            fscanf(fnet, "%s", sig); // get signal
            
            if(sig[0] == '['){
                get_width(sig, &upper_width, &lower_width);
                fscanf(fnet, "%s", sig); // get the actual signal; it was width

                while(sig[0] != ';'){
                    // allocate a signal node
                    rnew_sig = (struct RSIGNALS *) malloc(sizeof(struct RSIGNALS)); // allocate a signal type node
                    if(rnew_sig == NULL){
                        printf("%sMemory allocation failure in reconstruction_analysis_xilinx()%s\n", KRED, BLUE);
                        program_log(0x150C0901); // program error status
                        return ERR_MEMO;
                    }
                    rnew_sig->updated = 0; // update status
                    rnew_sig->nptr = NULL;
                    rnew_sig->iptr = NULL;                    
                    
                    strcpy(rnew_sig->net, sig); // set signal name
                    
                    // now link the signal node
                    if(rheader == NULL) rheader = rnew_sig;
                    else rcptr->nptr = rnew_sig;
                    
                    rcptr = rnew_sig; // update the current signal node
                    
                    // now link the signal bits
                    for(i = 0; i <= upper_width; i++){
                        // allocate a signal node
                        rnew_node = (struct RBITS *) malloc(sizeof(struct RBITS)); // allocate a signal bit type node
                        if(rnew_node == NULL){
                            printf("%sMemory allocation failure in reconstruction_analysis_xilinx()%s\n", KRED, BLUE);
                            program_log(0x150C0902); // program error status
                            return ERR_MEMO;
                        }
                        rnew_node->updated = 0; // update status
                        rnew_node->nptr = NULL;
                        
                        sprintf(istr, "[%d]", i); // convert i to string
                        strcpy(rnew_node->net, sig);
                        strcat(rnew_node->net, istr); // signal bit name set
                        rnew_node->val = 'x'; // set to 'X' by default
                        
                        if(rnew_sig->iptr == NULL) rnew_sig->iptr = rnew_node;
                        else riptr->nptr = rnew_node;
                        
                        riptr = rnew_node; // update current iptr
                    }

                    fscanf(fnet, "%s", sig); // get the next signal
                }                
            }
            else{
                while(sig[0] != ';'){
                    // allocate a signal node
                    rnew_sig = (struct RSIGNALS *) malloc(sizeof(struct RSIGNALS)); // allocate a signal type node
                    if(rnew_sig == NULL){
                        printf("%sMemory allocation failure in reconstruction_analysis_xilinx()%s\n", KRED, BLUE);
                        program_log(0x150C0903); // program error status
                        return ERR_MEMO;
                    }
                    strcpy(rnew_sig->net, sig); // set signal name
                    rnew_sig->updated = 0; // update status
                    rnew_sig->val = 'x'; // update status
                    rnew_sig->nptr = NULL;
                    rnew_sig->iptr = NULL;
                    
                    // now link the signal node
                    if(rheader == NULL) rheader = rnew_sig;
                    else rcptr->nptr = rnew_sig;
                    
                    rcptr = rnew_sig; // update the current signal node

                    fscanf(fnet, "%s", sig); // get the next signal
                }
            }
        }
    }

    // for debug here - after network construction
    //report_construction(rheader);

    // begin: construct design network of components for reconstruction analysis
    rewind(fnet); // go to beginning of file
    while(fscanf(fnet, "%s", keyword) != EOF){
        if(strcmp(keyword, "LUT2") == 0 || strcmp(keyword, "LUT3") == 0 || strcmp(keyword, "LUT4") == 0 || 
           strcmp(keyword, "LUT5") == 0 || strcmp(keyword, "LUT6") == 0){
            
            // allocate a lunit node
            lnew_unit = (struct LUNITS *) malloc(sizeof(struct LUNITS)); // allocate a signal type node
            if(lnew_unit == NULL){
                printf("%sMemory allocation failure in reconstruction_analysis_xilinx()%s\n", KRED, BLUE);
                program_log(0x150C0904); // program error status
                return ERR_MEMO;
            }
            strcpy(lnew_unit->type, keyword); // type of unit

            // process init value
            fscanf(fnet, "%s", sig);
            while(strcmp(sig, ".INIT") != 0) fscanf(fnet, "%s", sig);
            fscanf(fnet, "%s", vector);

            len = strlen(vector) - 1; // get length of vector

            // check the base of the initialization vector
            i = len;
            while(vector[i] != '\'') i--;

            if(vector[i+1] == 'h'){ // hex value
                init = 0; // reset value
                power = 0; // reset power as well
                while(vector[len] != 'h'){
                    init = init + (((unsigned long)char2hex(vector[len])) << power);

                    len--; // move to the previous character
                    power = power + 4; // each character represents for digits
                }
            }
            else if(vector[i+1] == 'd'){ // decimal value
                i = i + 2; // go to the highest digit
                init = 0; // reset value
                while(i <= len){
                    init = init * 10;
                    init = init + vector[i] - '0';

                    i++; // move to the previous character
                }
            }
            else{
                printf("The initialization value is not hex or decimal number\n");
                program_log(0x150C0905); // program error status
            }

            lnew_unit->init = init; // save init value
            lnew_unit->recon = 0; // default to 0

            // get UID
            fscanf(fnet, "%s", sig);
            strcpy(lnew_unit->uid, sig); // type of unit
                
            // set the pointers to null first
            lnew_unit->nptr = NULL;
            lnew_unit->iptr = NULL;
                
            // now link the signal node
            if(lheader == NULL) lheader = lnew_unit;
            else lcptr->nptr = lnew_unit;
                
            lcptr = lnew_unit; // update the current signal node
                
            // now link the input bits of LUT
            fscanf(fnet, "%s", sig);
            while(strcmp(sig, ".O") != 0){
                // allocate a signal node
                lnew_sig = (struct LBITS *) malloc(sizeof(struct LBITS)); // allocate a signal bit type node
                if(lnew_sig == NULL){
                    printf("%sMemory allocation failure in reconstruction_analysis_xilinx()%s\n", KRED, BLUE);
                    program_log(0x150C0906); // program error status
                    return ERR_MEMO;
                }
                fscanf(fnet, "%s", istr); // get signal name
                strcpy(lnew_sig->net, istr); // set the signal name
                lnew_sig->val = 'x'; // set default value to 'X'

                // now set the pointers
                if(strcmp(istr, "1'h0") == 0 || strcmp(istr, "1'h1") == 0){
                    lnew_sig->sptr = NULL;
                    lnew_sig->bptr = NULL;
                    lnew_sig->val = istr[strlen(istr) - 1] - '0'; // set to constant value
                }
                else{
                    find_sig_xilinx(rheader, istr, &rsptr, &rbptr); // find signal in design network
                    lnew_sig->sptr = rsptr;
                    lnew_sig->bptr = rbptr;
                }
                lnew_sig->nptr = NULL;
                    
                if(lnew_unit->iptr == NULL) lnew_unit->iptr = lnew_sig;
                else liptr->nptr = lnew_sig;
                    
                liptr = lnew_sig; // update current iptr

                fscanf(fnet, "%s", sig); // get the next signal name
            }
        }
        else if(strcmp(keyword, "MUXF7") == 0 || strcmp(keyword, "MUXF8") == 0){
            // allocate a lunit node
            lnew_unit = (struct LUNITS *) malloc(sizeof(struct LUNITS)); // allocate a signal type node
            if(lnew_unit == NULL){
                printf("%sMemory allocation failure in reconstruction_analysis_xilinx()%s\n", KRED, BLUE);
                program_log(0x150C0907); // program error status
                return ERR_MEMO;
            }
            strcpy(lnew_unit->type, keyword); // type of unit
            lnew_unit->recon = 0; // default to 0

            // get UID
            fscanf(fnet, "%s", sig);
            strcpy(lnew_unit->uid, sig); // type of unit

            // init value should be constant for MUXes
            lnew_unit->init = 0x35; // the truth table for MUX-2
                
            // set the pointers to null first
            lnew_unit->nptr = NULL;
            lnew_unit->iptr = NULL;
                
            // now link the signal node
            if(lheader == NULL) lheader = lnew_unit;
            else lcptr->nptr = lnew_unit;
                
            lcptr = lnew_unit; // update the current signal node
                
            // now link the input bits of MUX
            fscanf(fnet, "%s%s", sig, istr); // get I0
            // allocate a signal node
            lnew_sig = (struct LBITS *) malloc(sizeof(struct LBITS)); // allocate a signal bit type node
            if(lnew_sig == NULL){
                printf("%sMemory allocation failure in reconstruction_analysis_xilinx()%s\n", KRED, BLUE);
                program_log(0x150C0908); // program error status
                return ERR_MEMO;
            }
                
            strcpy(lnew_sig->net, istr); // set the signal name
            lnew_sig->val = 'x'; // set default value to 'X'

            // now set the pointers
            if(strcmp(istr, "1'h0") == 0 || strcmp(istr, "1'h1") == 0){
                lnew_sig->sptr = NULL;
                lnew_sig->bptr = NULL;
                lnew_sig->val = istr[strlen(istr) - 1] - '0'; // set to constant value
            }
            else{
                find_sig_xilinx(rheader, istr, &rsptr, &rbptr); // find signal in design network
                lnew_sig->sptr = rsptr;
                lnew_sig->bptr = rbptr;
            }
            lnew_sig->nptr = NULL;
                    
            lnew_unit->iptr = lnew_sig; // lnew_unit->iptr == NULL
            liptr = lnew_sig; // update current iptr

            fscanf(fnet, "%s%s", sig, istr); // get I1
            // allocate a signal node
            lnew_sig = (struct LBITS *) malloc(sizeof(struct LBITS)); // allocate a signal bit type node
            if(lnew_sig == NULL){
                printf("%sMemory allocation failure in reconstruction_analysis_xilinx()%s\n", KRED, BLUE);
                program_log(0x150C0909); // program error status
                return ERR_MEMO;
            }
                
            strcpy(lnew_sig->net, istr); // set the signal name
            lnew_sig->val = 'x'; // set default value to 'X'

            // now set the pointers
            if(strcmp(istr, "1'h0") == 0 || strcmp(istr, "1'h1") == 0){
                lnew_sig->sptr = NULL;
                lnew_sig->bptr = NULL;
                lnew_sig->val = istr[strlen(istr) - 1] - '0'; // set to constant value
            }
            else{
                find_sig_xilinx(rheader, istr, &rsptr, &rbptr); // find signal in design network
                lnew_sig->sptr = rsptr;
                lnew_sig->bptr = rbptr;
            }
            lnew_sig->nptr = NULL;
                    
            liptr->nptr = lnew_sig; // lnew_unit->iptr != NULL, I0 is already there
            liptr = lnew_sig; // update current iptr

            fscanf(fnet, "%s%s", sig, istr); // get O and skip it

            fscanf(fnet, "%s%s", sig, istr); // get S
            // allocate a signal node
            lnew_sig = (struct LBITS *) malloc(sizeof(struct LBITS)); // allocate a signal bit type node
            if(lnew_sig == NULL){
                printf("%sMemory allocation failure in reconstruction_analysis_xilinx()%s\n", KRED, BLUE);
                program_log(0x150C090A); // program error status
                return ERR_MEMO;
            }
                
            strcpy(lnew_sig->net, istr); // set the signal name
            lnew_sig->val = 'x'; // set default value to 'X'

            // now set the pointers
            if(strcmp(istr, "1'h0") == 0 || strcmp(istr, "1'h1") == 0){
                lnew_sig->sptr = NULL;
                lnew_sig->bptr = NULL;
                lnew_sig->val = istr[strlen(istr) - 1] - '0'; // set to constant value
            }
            else{
                find_sig_xilinx(rheader, istr, &rsptr, &rbptr); // find signal in design network
                lnew_sig->sptr = rsptr;
                lnew_sig->bptr = rbptr;
            }
            lnew_sig->nptr = NULL;
                    
            liptr->nptr = lnew_sig; // lnew_unit->iptr != NULL, I0 is already there
            liptr = lnew_sig; // update current iptr
        }
        //else // should be other components - do not care for now
    }

    // for debug here - after network construction
    //report_construction_xilinx(rheader);

    // for debug here - after LUT construction
    //report_lut_xilinx(lheader);

    lut_init_xilinx(lheader, fstat); // report LUT stats

    // now free the design network of signals
    free_rsignals_xilinx(rheader);

    // now free the design network of components
    free_lut_xilinx(lheader);
    
    return status;
}

// function: 03
/**
 *  LUT init value analysis
 * @param  lheader  header of design network
 * @param  fstat  file to store the statistics
 * @return  int
 */
int lut_init_xilinx(struct LUNITS *lheader, FILE *fstat)
{
    unsigned int switching = 0;
    unsigned int pow = 0, num_rows = 0, total_rows = 0;
    char istr[MAX_STR] = "\0";
    unsigned long init_val = 0;
    float entropy = 0.0;
    struct LUNITS *cptr = NULL;
    extern unsigned char debug_mode; // disable debug mode by default
    extern char project_path[MAX_STR];
    
    printf("lut_init\n");
    // if(debug_mode) program_log(0x15100E00); // program log
    
    fprintf(fstat, "Report the LUT init statistics:\r\n");
    cptr = lheader; // start from header
    while(cptr != NULL){
        // now perform LUT quality analysis
        if(strcmp(cptr->type, "LUT2") == 0 || strcmp(cptr->type, "LUT3") == 0 || strcmp(cptr->type, "LUT4") == 0 ||
            strcmp(cptr->type, "LUT5") == 0 || strcmp(cptr->type, "LUT6") == 0){
            // first calculate the number of rows in the full truth table
            num_rows = 1; // reset base value
            strcpy(istr, cptr->type);
            pow = istr[strlen(istr) - 1] - '0'; // this should be a number
            num_rows = num_rows << pow; // the total number of rows in the full truth table
            total_rows = num_rows; // keep a copy for output

            // now check the intial value
            init_val = cptr->init;
            switching = 0; // reset the switching counter
            while(init_val != 0){
                switching = switching + (init_val & 0x01); // check '1' bits
                init_val = init_val >> 1;
            }

            entropy = calc_entropy(pow, total_rows, switching);

            fprintf(fstat, "%lx %lu %u %u %f\r\n", cptr->init, cptr->init, switching, total_rows, entropy);
        }
        
        cptr = cptr->nptr; // next signal
    }

    printf("exit");
    return SUCCESS;
}

// pow - log_2(t - s) + log_2((t - s)/s)
float calc_entropy(unsigned int pow, unsigned int total_rows, unsigned int switching)
{
    float entropy = 0.0;
    float ones = 0.0, zeros = 0.0;

    ones = switching;
    zeros = total_rows - switching; // calculates the number of 0 bits; switch is the number of 1 bits

    entropy = ones / total_rows * (log10(total_rows/ones) / log10(2.0)) + zeros / total_rows * (log10(total_rows/zeros) / log10(2.0));
    //entropy = pow - log10(diff) / log10(2.0) + (ones / total_rows) * log10(diff/ones) / log10(2.0);

    return entropy;
}


// ##################################################################################
// function: 02
/**
 * format a Verilog FPGA netlist - pre-processing
 * @param  design_name  name of Verilog design file
 * @return  program status
 */
int format_netlist_xilinx(char *design_name)
{
    char para_str[MAX_STR] = "\0", keyword[MAX_STR] = "\0";
    char *line = NULL;
    size_t len = 0;
    unsigned long ptr = 0, endkeyword = 0, pos = 0, pos2 = 0;
    FILE *fverilog = NULL, *fnet = NULL;
    extern unsigned char debug_mode; // disable debug mode by default
    extern char project_path[MAX_STR]; // project path

    if(debug_mode) program_log(0x150C0200); // program log
    
    // Determine if input file is of appropraite extension
    if (design_name[strlen(design_name) - 2] == '.' && design_name[strlen(design_name) - 1] == 'v') {
        fverilog = fopen(design_name, "r");
        if(!fverilog){
            printf("%sDesign file open error in format_netlist_xilinx()!%s\n", KRED, BLUE);

            program_log(0x150C0201); // program error status
            return ERR_IN;
        }
    }
    else{
        puts("Please specify an appropriate Verilog file!");

        program_log(0x150C0202); // program error status
        return ERR_IN;
    }
    
    // clear filename extension
    strcpy(para_str, project_path);
    strcat(para_str, "/Outputs/");
    pos2 = strlen(para_str); // end of para_str

    pos = strlen(design_name);
    while(design_name[pos] != '/') pos--; // find file name
    pos++; // beginning of Verilog file name

    while(design_name[pos] != '.'){
        para_str[pos2++] = design_name[pos++];
    }
    para_str[pos2] = '\0'; // set end of file name
    
    // open the netlist file for output
    strcat(para_str, ".net");

    fnet = fopen(para_str, "w");
    if(!fnet){
        printf("%sOutput file open error in format_netlist_xilinx()!%s", KRED, BLUE);
        fclose(fverilog);

        program_log(0x150C0203); // program error status
        return ERR_OUT;
    }
    
    // get the first keyword and ready to start parsing the netlist
    fscanf(fverilog, "%s", keyword); // get the first keyword
    
    do{
        endkeyword = 0; // begin new keyword
        
        // read a lineline
        getline(&line, &len, fverilog);
        
        // we assume single line comments only
        if(keyword[0] == '/') ; // comments: nop operation
        
        else if(keyword[0] == '(' && keyword[1] == '*'); // comments for yosys files: nop operation
        
        else if(strcmp(keyword, "endmodule") == 0)
            fprintf(fnet, "%s\r\n", keyword); // print the keyword
        
        // the definition keywords
        else if(strcmp(keyword, "module") == 0 || strcmp(keyword, "input") == 0 || strcmp(keyword, "output") == 0 ||
                strcmp(keyword, "wire") == 0 || strcmp(keyword, "reg") == 0){
            fprintf(fnet, "%s", keyword); // print the keyword first
            
            do{
                // replace '(', ')', ',', and '\\' with space in string
                // and replace '/' with '_' in string
                replace_char(line, '(', ' ');
                replace_char(line, ')', ' ');
                replace_char(line, ',', ' ');
                //replace_char(line, '\\', ' ');
                //replace_char(line, '/', '_');
                
                replace_brackets(line); // deal with case of "[...]."
                
                ptr = strlen(line) - 1; // end of string
                if(line[ptr] == '\n') {
                    line[ptr] = '\0'; // remove the '\n'
                    ptr--;
                }
                if(line[ptr] == '\r') {
                    line[ptr] = '\0'; // also remove the '\r'
                    ptr--;
                }
                
                // output file line
                if(line[ptr] == ';'){
                    line[ptr] = '\0';
                    fprintf(fnet, "%s ;\r\n", line);
                    endkeyword = 1;
                }
                else{
                    fprintf(fnet, "%s\r\n", line);
                    getline(&line, &len, fverilog); // read a new line
                }
                
            }while(endkeyword == 0);
        }
        
        // the LUTs
        else if(strcmp(keyword, "LUT2") == 0 || strcmp(keyword, "LUT3") == 0 || strcmp(keyword, "LUT4") == 0 ||
                strcmp(keyword, "LUT5") == 0 || strcmp(keyword, "LUT6") == 0){
            fprintf(fnet, "%s", keyword); // print the keyword first
            
            do{
                // replace '(', ')', ',', and '\\' with space in string
                // and replace '/' with '_' in string
                replace_char(line, '(', ' ');
                replace_char(line, ')', ' ');
                replace_char(line, ',', ' ');
                //replace_char(line, '\\', ' ');
                //replace_char(line, '/', '_');
                move_space(line); // remove the white space before '['
                
                replace_brackets(line); // deal with case of "[...]."
                
                ptr = strlen(line) - 1; // end of string
                if(line[ptr] == '\n') {
                    line[ptr] = '\0'; // remove the '\n'
                    ptr--;
                }
                if(line[ptr] == '\r') {
                    line[ptr] = '\0'; // also remove the '\r'
                    ptr--;
                }
                
                if(line[ptr] == ';'){
                    line[ptr] = '\0';
                    fprintf(fnet, "%s ;\r\n", line);
                    endkeyword = 1;
                }
                else{
                    fprintf(fnet, "%s\r\n", line);
                    getline(&line, &len, fverilog); // read a new line
                }
                
            }while(endkeyword == 0);
        }
        
        else if(strcmp(keyword, "assign") == 0){
            fprintf(fnet, "%s ", keyword); // print the keyword first
            
            do{
                //replace_char(line, '\\', ' ');
                //replace_char(line, '/', '_');
                move_space(line); // remove the white space before '['
                
                replace_brackets(line); // deal with case of "[...]."
                
                ptr = strlen(line) - 1; // end of string
                if(line[ptr] == '\n') {
                    line[ptr] = '\0'; // remove the '\n'
                    ptr--;
                }
                if(line[ptr] == '\r') {
                    line[ptr] = '\0'; // also remove the '\r'
                    ptr--;
                }
                
                if(line[ptr] == ';'){
                    line[ptr] = '\0';
                    fprintf(fnet, "%s ;\r\n", line);
                    endkeyword = 1;
                }
                else if(line[ptr] == ','){
                    line[ptr] = '\0';
                    fprintf(fnet, "%s ;\r\nassign ", line);
                }
                else fprintf(fnet, "%s\r\n", line);
                
                if(endkeyword == 0) getline(&line, &len, fverilog); // read a new line
            }while(endkeyword == 0);
        }
        
        // module instantiations
        else{
            fprintf(fnet, "%s ", keyword); // print the keyword
                        
            do{
                // replace '(', ')', ',', and '\\' with space in string
                // and replace '/' with '_' in string
                replace_char(line, '(', ' ');
                replace_char(line, ')', ' ');
                replace_char(line, ',', ' ');
                //replace_char(line, '\\', ' ');
                //replace_char(line, '/', '_');
                move_space(line); // remove the white space before '['
                
                replace_brackets(line); // deal with case of "[...]."
                
                ptr = strlen(line) - 1; // end of string
                if(line[ptr] == '\n') {
                    line[ptr] = '\0'; // remove the '\n'
                    ptr--;
                }
                if(line[ptr] == '\r') {
                    line[ptr] = '\0'; // also remove the '\r'
                    ptr--;
                }
                
                if(line[ptr] == ';'){
                    line[ptr] = '\0';
                    fprintf(fnet, "%s ;\r\n", line);
                    endkeyword = 1;
                }
                else{
                    fprintf(fnet, "%s\r\n", line);
                    getline(&line, &len, fverilog); // read a new line
                }
                
            }while(endkeyword == 0);
        }
        
    }while(fscanf(fverilog, "%s", keyword) != EOF);
    
    fclose(fverilog);
    fclose(fnet);
    
    return SUCCESS;
}

// function: 12
/**
 *  find a signal
 * @param  rheader  header of design network
 * @param  sig  name of signal
 * @param  rsptr  pointer to signal list
 * @param  rbptr  pointer to signal bit
 * @return  void
 */
void find_sig_xilinx(struct RSIGNALS *rheader, char *sig, struct RSIGNALS **rsptr, struct RBITS **rbptr)
{
    char istr[MAX_STR] = "\0";
    int len = 0;
    struct RSIGNALS *sptr = NULL;
    struct RBITS *bptr = NULL;
    extern unsigned char debug_mode; // disable debug mode by default
    extern char project_path[MAX_STR];

    if(debug_mode) program_log(0x150C0C00); // program log

    sptr = rheader; // set to start of header
    strcpy(istr, sig); // make a copy

    len = strlen(istr) - 1; // get length of signal name
    if(istr[len] == ']'){ // this should be a bit in a vector
        while(istr[len] != '['){
            istr[len] = '\0';
            len--; // move to the previous character
        }
        istr[len] = '\0'; // also remove the ']'
    }

    while(sptr != NULL && strcmp(sptr->net, istr) != 0) sptr = sptr->nptr; // check the next signal

    if(sptr != NULL){
        if(strcmp(sptr->net, sig) == 0){
            *rsptr = sptr;
            *rbptr = NULL;
        }
        else{
            bptr = sptr->iptr; // check in signal bits

            while(bptr != NULL && strcmp(bptr->net, sig) != 0) bptr = bptr->nptr; // check the next signal bit

            if(bptr != NULL){
                *rsptr = sptr;
                *rbptr = bptr;
            }
            else{
                printf("Signal %s not found in design network in find_sig_xilinx()!\n", sig);
                program_log(0x150C0C01); // program log

                *rsptr = NULL;
                *rbptr = NULL;
            }
        }
    }
    else{
        printf("Signal %s not found in design network in find_sig_xilinx()!\n", sig);
        program_log(0x150C0C02); // program log

        *rsptr = NULL;
        *rbptr = NULL;
    }

    return;
}

// function: 11
/**
 *  free the design network for reconstruction
 * @param  rheader  header of design network
 * @return  void
 */
void free_rsignals_xilinx(struct RSIGNALS *rheader)
{
    struct RSIGNALS *cptr = NULL, *next_sig = NULL;
    struct RBITS *iptr = NULL, *next_bit = NULL;
    extern unsigned char debug_mode; // disable debug mode by default
    extern char project_path[MAX_STR];
    
    if(debug_mode) program_log(0x150C0B00); // program log
    
    cptr = rheader; // start from header
    while(cptr != NULL){
        next_sig = cptr->nptr; // the next signal
        
        if(cptr->iptr != NULL){ // also free the signal bits
            iptr = cptr->iptr; // point to the signal bits
            cptr->iptr = NULL; // un-link
            
            while(iptr != NULL){
                next_bit = iptr->nptr; // next signal bit
                
                iptr->nptr = NULL; // un-link
                free(iptr);
                
                iptr = next_bit; // next signal bit
            }
        }
        
        cptr->nptr = NULL; // un-link
        free(cptr);
        
        cptr = next_sig;
    }
    
    return;
}

// function: 19
/**
 *  free the LUT list
 * @param  lheader  header of design network
 * @return  void
 */
void free_lut_xilinx(struct LUNITS *lheader)
{
    struct LUNITS *cptr = NULL, *next_sig = NULL;
    struct LBITS *iptr = NULL, *next_bit = NULL;
    extern unsigned char debug_mode; // disable debug mode by default
    extern char project_path[MAX_STR];
    
    if(debug_mode) program_log(0x150C1300); // program log
    
    cptr = lheader; // start from header
    while(cptr != NULL){
        next_sig = cptr->nptr; // the next signal
        
        if(cptr->iptr != NULL){ // also free the signal bits
            iptr = cptr->iptr; // point to the signal bits
            cptr->iptr = NULL; // un-link
            
            while(iptr != NULL){
                next_bit = iptr->nptr; // next signal bit
                
                iptr->sptr = NULL; // un-link directly, design network of signals should have been freed
                iptr->bptr = NULL; // un-link directly, design network of signals should have been freed
                iptr->nptr = NULL; // un-link
                free(iptr);
                
                iptr = next_bit; // next signal bit
            }
        }
        
        cptr->nptr = NULL; // un-link
        free(cptr);
        
        cptr = next_sig;
    }
    
    return;
}

// function: 08
/**
 *  convert char to hex number
 * @param  ch  hex digit characteer
 * @return hex value
 */
unsigned int char2hex(char ch)
{
    unsigned int num = 0;
    extern unsigned char debug_mode; // disable debug mode by default
    extern char project_path[MAX_STR];
    
    if(debug_mode) program_log(0x150C0800); // program log
    
    if(ch >= '0' && ch <= '9') num = ch - '0';
    else if(ch >= 'a' && ch <= 'f') num = ch - 'a' + 10;
    else if(ch >= 'A' && ch <= 'F') num = ch - 'A' + 10;
    else if(ch == 'x' || ch == 'X') num = 'x'; // ignore un-initialized value - not reset properly
    else if(ch == 'z' || ch == 'Z') num = 'x'; // ignore high-impedence values
    else if(ch == '*') num = 'x'; // ignore long variables
    else if(ch == '\0') num = 'x'; // ignore null character
    else{
        printf("'%c' with value %x is not a hex digit\n", ch, ch);
        program_log(0x150C0801);
    }
    
    return num;
}
