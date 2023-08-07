// include header file
#include "../core_header.h"
#include "./cmd.h"

/**
 * Function that parses through command line user input, controlling workflow by
 * determining which network operation to perform by delegating/managing various
 * cmd_status tasks.
 * @param  void
 * @return  int  the end status of the cmd_parser; returns SUCCESS during
 *               normal operation, TERMINATE for program exit, and also
 *               specifies faulty user input
 */
int cmd_parser(void)
{
    int status = SUCCESS; // default to SUCCESS status
    int source = CMD_LINE; // default to command line input
    int cmd = NOP; // default to the "unknown" command
    char cmd_name[MAX_STR] = "help"; // default to the "nop" command
    char para_str[MAX_STR] = "\0", para_str2[MAX_STR] = "\0"; // input parameter as a string
    char ch = '\0'; // used for flushing input buffer
    FILE *fscript = NULL; // file pointer to the script file
    clock_t clk_start = 0; // for calculating command processing time
    extern unsigned char debug_mode; // disable debug mode by default
    extern char project_path[MAX_STR]; // saves the project path

    if(debug_mode) program_log(0x11011700); // program log status
    
    // create directories
    if(access("Sources/", F_OK)) system("mkdir Sources");
    if(access("SubModules/", F_OK)) system("mkdir SubModules");
    if(access("Outputs/", F_OK)) system("mkdir Outputs");
    if(access("Scripts/", F_OK)) system("mkdir Scripts");
    if(access("Reports/", F_OK)) system("mkdir Reports");
    
    // set ulimit
    // system("ulimit -n 99999");
    
    // timing information: start timer
    clk_start = clock();
    
    while(status){
        status = get_cmd(&source, fscript, cmd_name); // get command name as a string
        if(status == ENDOF && fscript) fclose(fscript); // close script file
        
        status = cmd_type(cmd_name, &cmd); // decode to get command type
        
        //printf("Executing command %d\n", cmd); // for debug
        
        // begin: the command parser
        switch(cmd){
            case EXIT           :   status = TERMINATE; // exit the program
                                    break;
                
            case NOP            :   // nop command, does nothing
                                    if(source == FILE_IO) printf("\n"); // no command parameter; redirect output to new line
                                    status = SUCCESS;
                                    break;
                
            case QUIT           :   status = TERMINATE; // quit the program
                                    break;
                
            case SOURCE         :   // run a script file
                                    status = get_parameter(source, fscript, para_str);

                                    if(strcmp(project_path, "\0") == 0){// project path not set yet
                                        strcpy(para_str2, para_str); // copy file path and name

                                        // get the project root path
                                        remove_extension(para_str2, '/');
                                        remove_extension(para_str2, '/');

                                        strcpy(project_path, para_str2); // set project path
                                    }
                
                                    if(status == EMPT_BUF) command_info(cmd); // missing command parameter
                                    else{
                                        fscript = fopen(para_str, "r");
                                        
                                        if(!fscript) puts("Source script file does not exist");
                                        else source = FILE_IO; // redirect input source to file
                                    }
                                    break;
            
            case STAT_XILINX    :   status = get_parameter(source, fscript, para_str); // get the verilog file name
                                    if(status == EMPT_BUF) command_info(cmd); // missing command parameter
                                    else{
                                        status = stat_lut_xilinx(para_str); // perform LUT stat analysis
                                    }
                                
                                    break;
            
            case STATUS         :   // program program status
                                    if(source == FILE_IO) printf("\n"); // no command parameter; redirect output to new line
                
                                    status = program_status(status); // print runtime information
                                    break;
            
        	case SUB_MODULES    :   status = get_parameter(source, fscript, para_str); // get the file name containing the set of files
                
                                    if(strcmp(project_path, "\0") == 0){// project path not set yet
                                        strcpy(para_str2, para_str); // copy file path and name

                                        // get the project root path
                                        remove_extension(para_str2, '/');
                                        remove_extension(para_str2, '/');

                                        strcpy(project_path, para_str2); // set project path
                                    }
                
                                    if(status == EMPT_BUF) command_info(cmd); // missing command parameter
                                    else status = sub_modules(para_str);
                
                                    break;
            
            case TIME           :   // print runtime statistics
                                    if(source == FILE_IO) printf("\n"); // no command parameter; redirect output to new line
                
                                    status = print_runtime(&clk_start); // print runtime information
                                    break;
                
            case UNKNOWN        :   printf("Unknown command %s! Try the \"help\" command\n", cmd_name); // unknown command
                
                                    program_log(0x11011706); // program error status
                                    status = ERR_CMD;
                                    break;
            
            default             :   printf("%sUnexpected program behavior%s\n", KRED, BLUE); // never expected
                                    status = ERR_CMD; // quit the program
                                    break;
        }
        // end: the command parser
        
        // need to flush input buffer
        if(source == CMD_LINE)
            while(status != EMPT_BUF && (ch = getchar()) != '\n' && ch != EOF);
    }
    
    // end of program log for this run
    program_log(0x00); // normal status, force new line
    
    return status;
}

// function: 18
/**
 * Helper function which will retrieve command input from user
 * either through the command line or a script file; otherwise defaults
 * to "nop"
 * @param  source  CMD_LINE pointer
 * @param  fscript  File pointer to the script file
 * @param  cmd_name  Defaults to the "nop" command;
 *                   will otherwise contain command input from user
 * @return  int  program status
 */
int get_cmd(int * source, FILE *fscript, char * cmd_name)
{
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x11011800); // program log status

    // get command from command prompt or script file
    if(*source == CMD_LINE){ // command line input
        printf(">>"); // command prompt
        scanf("%s", cmd_name); // get command
    }
    else{ // run script file
        if(fscanf(fscript, "%s", cmd_name) != EOF){ // run until the end of script file
            printf(">>%s ", cmd_name); // echo command
            *source = FILE_IO; // set input source to script file
        }
        else{
            strcpy(cmd_name, "nop"); // end of file, issue an nop command
            *source = CMD_LINE; // redirect command source to command line
            return ENDOF; // status for closing script file
        }
    }
    
    return SUCCESS;
}

// function: 19
/**
 * Determines the status of command line input and also gets file name
 * from either the command line or a script file.
 * @param  source
 * @param  fscript
 * @param  para_str
 * @return  int  SUCCESS if file name is accessed else, EMPT_BUF if input
 *               buffer is empty
 */
int get_parameter(int source, FILE * fscript, char * para_str)
{
    int status = SUCCESS;
    char ch = '\0'; // used for testing input buffer
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x11011900); // program log status
    
    if(source == CMD_LINE){ // command line input
        if((ch = getchar()) == '\n' || ch == EOF){ // missing command parameter
            program_log(0x11011901); // program error status
            status = EMPT_BUF; // program status: success, input buffer empty
        }
        else{
            scanf("%s", para_str); // get file name as parameter from command line
            status = SUCCESS;
        }
    }
    else{
        fscanf(fscript, "%s", para_str); // get file name as parameter from file
        printf("%s\n", para_str); // echo parameter
        
        status = SUCCESS;
    }
    
    return status;
}

// function: 1A
/**
 * Function to interpret a command string to determine the correct IFT operation
 * to be performed.
 * @param  cmd  int to store the IFT operation
 * @param  cmd_str  command string
 * @return  int  program status
 */
int cmd_type(char *cmd_str, int * cmd)
{
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x11011A00); // program log status

    if(strcmp(cmd_str, "exit") == 0) *cmd = EXIT; // the "exit" command; exits the program
    else if(strcmp(cmd_str, "nop") == 0) *cmd = NOP; // make synthesis script
    else if(strcmp(cmd_str, "quit") == 0) *cmd = QUIT; // the "quit" command; quits the program
    else if(strcmp(cmd_str, "source") == 0) *cmd = SOURCE; // the "source" command; runs a script file
    else if(strcmp(cmd_str, "stat_xilinx") == 0) *cmd = STAT_XILINX; // LUT stat analysis for Xilinx FPGA
    else if(strcmp(cmd_str, "status") == 0) *cmd = STATUS; // prints program status
    else if(strcmp(cmd_str, "sub_modules") == 0) *cmd = SUB_MODULES; // gets individual modules from a synthesized netlist file
    else if(strcmp(cmd_str, "time") == 0) *cmd = TIME; // the "time" command; prints runtime informaiton
    else *cmd = UNKNOWN; // unknown command
    
    return SUCCESS;
}

// function: 1B
/**
 * Helper function, which interprets program status and outputs status data to stdout,
 * providing user with information about program execution and completion.
 * @param  status  status to be interpretted
 * @return  int  program status
 */
int program_status(int status)
{
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x11011B00); // program log status

    // this function prints the status of the last command
    switch(status){
        case TERMINATE  :   printf("Program completed\n%s", NORM); break;
        case START      :   puts("Program started"); break;
        case SUCCESS    :   puts("Function completed successfully"); break;
        case ENDOF      :   puts("End of file"); break;
        case ERR_IN     :   puts("Input file open error"); break;
        case ERR_OUT    :   puts("Output file open error"); break;
        case ERR_CMD    :   puts("Unknown command"); break;
        case EMPT_BUF   :   puts("Success and input buffer empty"); break;
        case EMPT_DES   :   puts("Empty design"); break;
        default         :   break;
    }
    
    return SUCCESS;
}

// function: 1C
/**
 * Helper function, which interprets program log code as debug trace,
 * providing user with information about program execution log.
 * @param  log_code  execution log code to be interpretted
 * @return  void
 */
void program_log(int log_code)
{
    FILE *flog = NULL;

    flog = fopen("./Reports/log.txt", "a+");
    if(!flog){
        puts("Program log file create error!");
        return;
    }

    // this function prints the error code when the program has an exception
    if(log_code != 0) fprintf(flog, "%x  ", log_code);
    else fprintf(flog, "\r\n\r\n");

    printf("#COMMAND STATUS#%x\n", log_code);

    fclose(flog);

    return;
}

// function: 1D
/**
 * Function that calculates timing information for command processing
 * and outputs to stdout for reference and efficiency analysis
 * @param  clk_start  clock_t start reference used in calculating proccessing time
 * @return  int  program status
 */
int print_runtime(clock_t * clk_start)
{
    clock_t clk_stop = 0; // for calculating command processing time
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x11011D00); // program log status
    
    // timing information: stop timer
    clk_stop = clock();
    
    // prints total runtime since last invoked
    printf("Total time used %f sec\n", (float)(clk_stop - *clk_start) / CLOCKS_PER_SEC); // time used in seconds
    
    *clk_start = clk_stop; // update timer
    
    return SUCCESS;
}

// function: 1E
/**
 * Function to convert string parameter to number parameter
 * @param  para_str  string parameter
 * @return  int  number parameter
 */
int str2num(char *para_str)
{
    int i, para_num = 0;
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x11011E00); // program log status
    
    for(i = 0; i < strlen(para_str); i++)
        para_num = para_num * 10 + para_str[i] - '0';
    
    return para_num;
}

/*
// function: 1F
ssize_t getline(char **lineptr, size_t *n, FILE *stream) {
    size_t pos;
    int c;
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x11011F00); // program log status

    if (lineptr == NULL || stream == NULL || n == NULL) {
        program_log(0x11011F01); // program error status
        return -1;
    }

    c = fgetc(stream);
    if (c == EOF) {
        program_log(0x11011F02); // program error status
        return -1;
    }

    if (*lineptr == NULL) {
        *lineptr = static_cast<char*>(malloc(128));
        if (*lineptr == NULL) {
            program_log(0x11011F03); // program error status
            return -1;
        }
        *n = 128;
    }

    pos = 0;
    while(c != EOF) {
        if (pos + 1 >= *n) {
            size_t new_size = *n + (*n >> 2);
            if (new_size < 128) {
                new_size = 128;
            }
            char *new_ptr = static_cast<char*>(realloc(*lineptr, new_size));
            if (new_ptr == NULL) {
                program_log(0x11011F04); // program error status
                return -1;
            }
            *n = new_size;
            *lineptr = new_ptr;
        }

        ((unsigned char *)(*lineptr))[pos ++] = c;
        if (c == '\n') {
            break;
        }
        c = fgetc(stream);
    }

    (*lineptr)[pos] = '\0';
    return pos;
}
*/
