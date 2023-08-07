default: xsize clean


check_size: ./check_size.c
	gcc -c -g -Wall ./check_size.c

xsize: check_size
	gcc -o xsize check_size.o


clean:
	rm *.o


cleanall: clean
	rm xsize
