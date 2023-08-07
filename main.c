// include header file
#include "core_header.h"

// global variables
unsigned char debug_mode = 0; // disable debug mode by default
char project_path[MAX_STR] = "."; // project path

int main(void)
{
    int status = START; // program status: start program
    char *time_str = NULL;
    time_t timep; // construct that holds time information
    
    time(&timep); // get current time
    time_str = ctime(&timep);
    time_str[strlen(time_str) - 1] = '\0'; // get rid of '\n'
    printf("%sstat_xilinx tool ver 1.0 (Compiled %s)\n", BLUE, time_str);
    
    // begin: system call
    /////////////////////////////////////////////////////////////////////////
    
    // clean up quietly - remove files from previous run
    //puts("Removing files from previous run...");
    //clear();
    
    // end: system call
    /////////////////////////////////////////////////////////////////////////
    
    // begin: function calls
    /////////////////////////////////////////////////////////////////////////
    
    status = cmd_parser(); // process to commands
    
    program_status(status); // print the program status
    
    // end: function calls
    /////////////////////////////////////////////////////////////////////////
    
    return status;
}
