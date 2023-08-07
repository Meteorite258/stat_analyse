#include "stdio.h"
#include "stdlib.h"

int main()
{
    short a = 10;
    int b = 100;
   
    int short_length = sizeof a;
    int int_length = sizeof(b);
    int long_length = sizeof(long);
    int char_length = sizeof(char);
   
    printf("char = %d byte(s), short = %d bytes, int = %d bytes, long = %d bytes\n", char_length, short_length, int_length, long_length);
   
    return 0;
}
