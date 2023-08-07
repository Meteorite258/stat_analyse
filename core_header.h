#ifndef CORE_HEADER_H
#define CORE_HEADER_H

// include C header files
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <math.h>

//#define USING_WIN32 // Now should use Win32 dos cmd

// constants
// color text settings
#define KRED    ""      // red
#define KGRN    ""      // green
//#define KWHT    "\033[1;37m"  // white
#define BLUE    ""      // blue
#define NORM    ""      // normal

// maximum number of design modules
#define MAX_MODULE  999

// maximum string length
#define MAX_STR     800
#define MAX_STR2    2000

// maximum number of variables per line
#define MAX_NUM     10

// maximum UID/name length
#define MAX_NAME    32
#define MAX_NAMEX2  64
#define MAX_NAMEX4  128

// input source
#define CMD_LINE    0
#define FILE_IO     1

// program status
enum STATUS{
    TERMINATE = 0,// terminate the program
    START, // start the program
    SUCCESS, // command success
    ENDOF, // end of file
    ERR_IN, // input error
    ERR_OUT, // output error
    ERR_CMD, // unknown command
    ERR_MEMO, // allocate memory failure
    ERR_CODE, // print error code
    EMPT_BUF, // buffer empty
    EMPT_DES, // empty design
    RECON_MUX, // MUX needs to be reconstructed
    RECON_LUT, // LUT needs to be reconstructed
    RECON_GATE, // Gate needs to be reconstructed
};

// Note: Chao modified ABC to OUR_ABC for avoiding the conflict with the struct ABC in windows.h
// command type
enum CMDTYPE{
    EXIT = 0, // exit the program
    NOP, // the nop command, does nothing
    QUIT, // quit the program
    SOURCE, // batch mode: parser commands in script file
    STAT_XILINX, // LUT stat analysis for Xilinx FPGA
    STATUS, // get program status
    SUB_MODULES, // get individual modules from a synthesized netlist file
    TIME, // print run time information
    UNKNOWN, // unknown command
};

// the following data structure is for switching probability analysis
struct SIGNALS {
    char net[MAX_NAMEX2]; // input, output or wire name
    unsigned long switching; // switching count
    struct SIGNALS *nptr; // pointer to the next input, output or wire
    struct SBITS *iptr; // pointer to internal bits
};

// internal node
struct SBITS {
    char net[MAX_NAMEX2]; // name of wire
    char val; // value for signal bit
    unsigned long switching; // switching count
    struct SBITS *nptr; // pointer to the nextd internal bits
};

// the following data structure is for LUT reconstruction analysis
struct RSIGNALS {
    char net[MAX_NAMEX2]; // input, output or wire name
    char val; // value for signal bit
    char updated; // update status
    struct RSIGNALS *nptr; // pointer to the next input, output or wire
    struct RBITS *iptr; // pointer to internal bits
};

// internal node for reconstruction analysis
struct RBITS {
    char net[MAX_NAMEX2]; // name of wire
    char val; // value for signal bit
    char updated; // update status
    struct RBITS *nptr; // pointer to the nextd internal bits
};

// LUT components
struct LUNITS {
    char type[MAX_NAMEX2]; // input, output or wire name
    char uid[MAX_NAMEX2]; // input, output or wire name
    unsigned long init; // initialization vector
    unsigned long recon; // reconstructed vector
    struct LUNITS *nptr; // pointer to the next input, output or wire
    struct LBITS *iptr; // pointer to internal bits
};

// signal bits connected to LUTs
struct LBITS {
    char net[MAX_NAMEX2]; // name of wire
    char val; // value for signal bit
    struct RSIGNALS *sptr; // pointer to the input, output or wire
    struct RBITS *bptr; // pointer to specific sigal bit
    struct LBITS *nptr; // pointer to the nextd internal bits
};

// internal node for reconstruction analysis
struct FRBITS {
    char type[MAX_NAMEX2];
	char net[MAX_NAMEX2]; // name of wire
    char val; // value for signal bit
    char updated; // update status
    struct FRBITS *nptr; // pointer to the nextd internal bits
	struct FLUNITS *fin1; //added
	struct FLUNITS *fin2;  //added
	struct FLUNITS *fin3;  //added
	struct FLUNITS *fin4;  //added
};

// the following data structure is for LUT reconstruction analysis
struct FRSIGNALS {
    char type[MAX_NAMEX2]; // input, output or wire name
	char net[MAX_NAMEX2];  //name
    char val; // value for signal bit
    char updated; // update status
    struct FRSIGNALS *nptr; // pointer to the next input, output or wire
    struct FRBITS *iptr; // pointer to internal bits
	struct FLUNITS *fin1;  //added
	struct FLUNITS *fin2;  //added
	struct FLUNITS *fin3;  //added
	struct FLUNITS *fin4;  //added	
};

// signal bits connected to LUTs
struct FLBITS {
    char net[MAX_NAMEX2]; // name of wire
    char val; // value for signal bit
    struct FRSIGNALS *sptr; // pointer to the input, output or wire
    struct FRBITS *bptr; // pointer to specific sigal bit
    struct FLBITS *nptr; // pointer to the nextd internal bits
};

// LUT components
struct FLUNITS {
    char type[MAX_NAMEX2]; // input, output or wire name
    char uid[MAX_NAMEX2]; // input, output or wire name
    unsigned long init; // initialization vector
    unsigned long recon; // reconstructed vector
    struct FLUNITS *nptr; // pointer to the next input, output or wire
    struct FLBITS *iptr; // pointer to input signals bits
	char outsig[MAX_NAMEX2]; // output signal added
};

#ifdef __cplusplus
extern "C" {
#endif

// error codes
// cmd - 0x11
// common - 0x12
// hierarchy - 0x13
// standard - 0x14
// prime - 0x15
// mls - 0x16
// timing - 0x17
// fault - 0x18

///////////////////////////////////////////////////////////////////////
// functions in cmd_machine.c
///////////////////////////////////////////////////////////////////////
int cmd_parser(void); // command parser entrance
int get_cmd(int *source, FILE *fscript, char *cmd_name); // get command name
int get_parameter(int source, FILE *fscript, char *para_str); // get commandn parameter
int cmd_type(char *cmd_str, int *cmd); // get command type
void program_log(int log_code); // print program execution log
int program_status(int err_code); // print program error code
int print_runtime(clock_t *clk_start); // print run time information
int str2num(char *para_str); // converts string parameter to number
ssize_t getline(char **lineptr, size_t *n, FILE *stream);

///////////////////////////////////////////////////////////////////////
// functions in common.c
///////////////////////////////////////////////////////////////////////
void clear(void); // perform clean up
int remove_extension(char *str, char ch); // remove file extension
int skip_to_keyword(FILE *fin, char *keyword); // skip to specific keyword while reading file
int get_width(char *para, int * upper_width, int *lower_width); // get width of a signal
int format_netlist(char *design_name); // pre-processing of netlist
int move_space(char * str); // get rid of additional white space
int replace_char(char * str, char ch, char replace_ch); // replace a character
int replace_brackets(char * str); // replace the brackets before '.'

///////////////////////////////////////////////////////////////////////
// functions in help.c
///////////////////////////////////////////////////////////////////////
int command_info(int cmd);


///////////////////////////////////////////////////////////////////////
// functions in sub_modules.c
///////////////////////////////////////////////////////////////////////
int sub_modules(char* file_name); // get sub design modules


///////////////////////////////////////////////////////////////////////
// functions in stat_lut_xilinx.c
///////////////////////////////////////////////////////////////////////
int stat_lut_xilinx(char * design_name);
int init_analysis_xilinx(char *design_name, FILE *fnet, FILE *fstat);
int lut_init_xilinx(struct LUNITS *lheader, FILE *fstat);
float calc_entropy(unsigned int pow, unsigned int total_rows, unsigned int switching);
int format_netlist_xilinx(char *design_name);
void find_sig_xilinx(struct RSIGNALS *rheader, char *sig, struct RSIGNALS **rsptr, struct RBITS **rbptr);
void free_rsignals_xilinx(struct RSIGNALS *rheader);
void free_lut_xilinx(struct LUNITS *lheader);
unsigned int char2hex(char ch);

#endif
