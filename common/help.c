// include header file
#include "../core_header.h"

// function: 01
/**
 * prints help informtion - lists all commands
 * @param  void
 * @return  int  program status
 */

// function: 02
/**
 * prints command usage informtion
 * @param  cmd  command code
 * @return  int  program status
 */
int command_info(int cmd)
{
    extern unsigned char debug_mode; // disable debug mode by default

    if(debug_mode) program_log(0x12020200); // program log

    // begin: help parser
    switch(cmd){
            
            case EXIT           :   puts("Exit the program\nE.g., exit"); // Exit the program
                                    break;
            
            case NOP            :   puts("Nop command, does nothing\nE.g., nop"); // NOP command, does nothing
                                    break;
            
            case QUIT           :   puts("Quit the program\nE.g., quit"); // Quit the program
                                    break;
                                
            case SOURCE         :   puts("Run a batch script file\nE.g., source script_file.sc"); // Run a script file
                                    break;
                                
            case STATUS         :   puts("Print program status\nE.g., status"); // Print program status
                                    break;
                                
            case SUB_MODULES    :   puts("Get sub-modules from design hierarchy\nE.g., sub_modules design.v"); // Get sub-modules
                                    puts("Note that the design name should not match any module name"); // Get sub-modules
                                    break;
            
            case TIME           :   puts("Print program run time statistics\nE.g., time"); // Print runtime information
                                    break;
            
            case UNKNOWN        :   puts("Unknown command! Try the \"help\" command"); // Unknown command
                                    break;
            
            default             :   puts("Unexpected program behavior!"); // Never expected
                                    program_log(0x12020201); // program error status
                                    break;
    }
    
    return SUCCESS;
}

