///////////////////////////////////////////////////////////////////////
// functions in cmd_machine.c
///////////////////////////////////////////////////////////////////////
int cmd_parser(void); // command parser entrance
int get_cmd(int *source, FILE *fscript, char *cmd_name); // get command name
int get_parameter(int source, FILE *fscript, char *para_str); // get commandn parameter
int cmd_type(char *cmd_str, int *cmd); // get command type
int program_status(int status); // print program status
int print_runtime(clock_t *clk_start); // print run time information
int str2num(char *para_str); // converts string parameter to number
