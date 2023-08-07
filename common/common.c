// header files
#include "../core_header.h"

// function: 01
/**
 * Post-proccessing function which removes intermdiate files
 * @param  void
 * @return  void
 */
void clear(void)
{
    extern unsigned char debug_mode; // disable debug mode by default
    extern char project_path[MAX_STR]; // project path
    char cmd[MAX_STR] = "\0";

    if(debug_mode) program_log(0x12010100); // program log

    puts("Removing files from previous run...");

    if(strcmp(project_path, "\0") == 0){
        puts("Project path not set yet!");

        program_log(0x12010101); // program error status
        return; // do nothing
    }
    
    // system calls
    #ifndef USING_WIN32
        strcpy(cmd, "rm -f ");
        strcat(cmd, project_path);
        strcat(cmd, "/Outputs/*.*");
        system(cmd);

        strcpy(cmd, "rm -f ");
        strcat(cmd, project_path);
        strcat(cmd, "/Properties/*.prout");
        system(cmd);

        strcpy(cmd, "rm -f ");
        strcat(cmd, project_path);
        strcat(cmd, "/Reports/*.*");
        system(cmd);

        strcpy(cmd, "rm -f ");
        strcat(cmd, project_path);
        strcat(cmd, "/SubModules/*.v");
        system(cmd);

        strcpy(cmd, "rm -f ");
        strcat(cmd, project_path);
        strcat(cmd, "/Scripts/*.*");
        system(cmd);
    #else
        strcpy(cmd, "del /f ");
        strcat(cmd, project_path);
        strcat(cmd, "\\Outputs\\*.*");
        system(cmd);

        strcpy(cmd, "del /f ");
        strcat(cmd, project_path);
        strcat(cmd, "\\Properties\\*.prout");
        system(cmd);

        strcpy(cmd, "del /f ");
        strcat(cmd, project_path);
        strcat(cmd, "\\Reports\\*.*");
        system(cmd);

        strcpy(cmd, "del /f ");
        strcat(cmd, project_path);
        strcat(cmd, "\\SubModules\\*.v");
        system(cmd);

        strcpy(cmd, "del /f ");
        strcat(cmd, project_path);
        strcat(cmd, "\\Scripts\\*.*");
        system(cmd);
    #endif
    
    return;
}

// function: 02
/**
 * Preproccessing function which removes file extentions
 * @param  str  input string
 * @param  ch   extension marker
 * @return  program status
 */
int remove_extension(char *str, char ch)
{
    long dot_position = 0;
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x12010200); // program log
    
    // find dot position
    dot_position = strlen(str) - 1; // this is the last valid character
    while(dot_position >= 0 && str[dot_position] != ch) dot_position--; // look for the dot (file extension)
    
    // remove file name extension
    str[dot_position] = '\0';
    
    if(dot_position == 0){
        printf("Note: symbol %c not found in remove_extension()!\n", ch);

        program_log(0x12010201); // program error status
        return ENDOF;
    }

    else return SUCCESS;
}

// function: 03
/**
 * Function to find keyword
 * @param  fin  input file
 * @param  keyword   keyword
 * @return  program status
 */
int skip_to_keyword(FILE *fin, char *keyword)
{
    char str[MAX_STR] = "\0";
    int match = 1;
    char *line = NULL;
    size_t len = 0;
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x12010300); // program log
    
    // skip to specified keyword
    while(match != 0){
        if(fscanf(fin, "%s", str) == EOF){
            printf("Reached the end of file - keyword %s not found in skip_to_keyword()!\n", keyword);
            program_log(0x12010301); // program error status
            return ENDOF;
        }
        
        // skipe simple comment, assume single line comments only
        if(str[0] == '/' || (str[0] == '(' && str[1] == '*')) getline(&line, &len, fin);
        
        match = strcmp(str, keyword);
    }
    
    return SUCCESS;
}

// function: 04
 /**
 * get width of a signal
 * @param  para  input signal
 * @param  upper_width   the upper width
 * @param  lower_width   the lower width
 * @return  program status
 */
// get signal width [lower_width] or [upper_width : l ower_width]
int get_width(char *para, int * upper_width, int *lower_width)
{
    int width = 0, power = 1;
    long position = 0;
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x12010400); // program log
    
    position = strlen(para);
    while(para[position] != ']') position--; // look for ']'
    
    position--; // move one more step left
    width = 0; // reset width
    while(para[position] != '[' && para[position] != ':'){ // look for '[' or ':'
        if(para[position] >= '0' && para[position] <= '9'){// check to make sure it is a number
            width = width + (para[position] - '0') * power; // convert char to number
            power = power * 10;
        }
        
        // para[position] = '\0'; // remove character
        position--; // keep moving
    }
    
    if(para[position] == '['){ // no ':' found
        *upper_width = width;
        *lower_width = -1; // no vilid lower_width
    }
    else{
        *lower_width = width; // already got lower_width
        
        position--; // move one more step left; should be ':' now
        width = 0; // reset width
        power = 1; // reset power too
        while(para[position] != '['){ // look for '['
            if(para[position] >= '0' && para[position] <= '9'){// check to make sure it is a number
                width = width + (para[position] - '0') * power; // convert char to number
                power = power * 10;
            }
            
            position--; // keep moving
        }
        
        *upper_width = width; // get upper_width now
    }
    
    para[position] = '\0'; // remove character '[' and afterwards
    
    return SUCCESS;
}

// function: 05
/**
 * format a Verilog netlist - pre-processing
 * @param  design_name  name of Verilog design file
 * @return  program status
 */
int format_netlist(char *design_name)
{
    char para_str[MAX_STR] = "\0", keyword[MAX_STR] = "\0";
    char *line = NULL;
    size_t len = 0;
    unsigned long ptr = 0, endkeyword = 0, pos = 0, pos2 = 0;
    FILE *fverilog = NULL, *fnet = NULL;
    extern unsigned char debug_mode; // disable debug mode by default
    extern char project_path[MAX_STR]; // project path

    if(debug_mode) program_log(0x12010500); // program log
    
    // Determine if input file is of appropraite extension
    if (design_name[strlen(design_name) - 2] == '.' && design_name[strlen(design_name) - 1] == 'v') {
        fverilog = fopen(design_name, "r");
        if(!fverilog){
            printf("%sDesign file open error in format_netlist()!%s\n", KRED, BLUE);

            program_log(0x12010501); // program error status
            return ERR_IN;
        }
    }
    else{
        puts("Please specify an appropriate Verilog file!");

        program_log(0x12010502); // program error status
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
        printf("%sOutput file open error in format_netlist()!%s", KRED, BLUE);
        fclose(fverilog);

        program_log(0x12010503); // program error status
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
                replace_char(line, '\\', ' ');
                replace_char(line, '/', '_');
                
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
        
        else if(strcmp(keyword, "assign") == 0){
            fprintf(fnet, "%s ", keyword); // print the keyword first
            
            do{
                replace_char(line, '\\', ' ');
                replace_char(line, '/', '_');
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
            if(strcmp(keyword, "\\**FFGEN**") == 0) fprintf(fnet, "%s ", "FFGEN");
            else fprintf(fnet, "%s ", keyword); // print the keyword
                        
            do{
                // replace '(', ')', ',', and '\\' with space in string
                // and replace '/' with '_' in string
                replace_char(line, '(', ' ');
                replace_char(line, ')', ' ');
                replace_char(line, ',', ' ');
                replace_char(line, '\\', ' ');
                replace_char(line, '/', '_');
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

// function: 06
/**
 * get rid of space before '['
 * @param  str  a line in the design file
 * @return  program status
 */
int move_space(char * str)
{
    unsigned long ptr = 0;
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x12010600); // program log
    
    for(ptr = 0; ptr < strlen(str); ptr++){
        if(str[ptr] == '[' && str[ptr - 1] == ' '){
            while(str[ptr] != ']'){// possible improvement!!! - need to check str[ptr+1] != '['
                str[ptr - 1] = str[ptr]; // get rid of white space before '['
                ptr++;
            }
            
            str[ptr - 1] = str[ptr]; // move the ']' as well
            str[ptr] = ' '; // the space is moved here
        }
    }
    
    return SUCCESS;
}

// function: 07
/**
 * replace a character with another
 * @param  str  a line in the design file
 * @param  ch  to be replaced
 * @param  replace_ch  the replacement
 * @return  program status
 */
int replace_char(char * str, char ch, char replace_ch)
{
    unsigned long ptr = 0;
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x12010700); // program log
    
    for(ptr = 0; ptr < strlen(str); ptr++)
        if(str[ptr] == ch) str[ptr] = replace_ch; // replace character
    
    return SUCCESS;
}

// function: 08
/**
 * deal with cases of "[...]."
 * @param  str  a line in the design file
 * @return  program status
 */
int replace_brackets(char * str)
{
    long ptr = 0, ptr2 = 0, brackets_true = 0; // string length can be 0!!!
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x12010800); // program log

    ptr =  strlen(str) - 1; // string length can be 0!!!
    brackets_true = 0;
    while(ptr > 0 && (str[ptr] != ':' || brackets_true == 0)){
        if(str[ptr] == ']') brackets_true = 1;
        else if(str[ptr] == '[') brackets_true = 0;
        ptr--;
    }
    if(ptr != 0){
        while(str[ptr] != ']') ptr++; // find ']'
        if(str[ptr + 1] != ' '){
            ptr2 =  strlen(str) + 1; // string length can be 0!!!
            while(ptr2 != ptr + 1) {
                str[ptr2] = str[ptr2 - 1];
                ptr2--;
            }
            str[ptr2] = ' ';
        }
    }
    
    ptr =  strlen(str) - 1; // string length can be 0!!!
    while(ptr > 0){
        //if((str[ptr] == '.' || str[ptr] == '_') && str[ptr - 1] == ']'){
        if(str[ptr] == '.' && str[ptr - 1] == ']'){
            str[ptr - 1] = '_'; // replace ']' before '.' with '_'
            while(str[ptr] != '[') ptr--; // find the '['
            
            str[ptr] = '_'; // replace the '[' with '_'
        }
        
        ptr--; // move pointer
    }
    
    return SUCCESS;
}

