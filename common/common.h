#ifndef COMMON_H
#define COMMON_H
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

#endif