// include header file
#include "../core_header.h"

// function: 01
/**
 * Function to get all the sub modules from a Verilog design file
 * @param  file_name  pointer to Verilog design file
 * @return  int  program status
 */
int sub_modules(char* file_name)
{
    int status = SUCCESS; // program status: success
    unsigned long ptr = 0; // pointer to access char array
    char keyword[MAX_STR] = "\0"; // get Verilog keyword
    char module_name[MAX_STR] = "\0"; // module name
    char para_str[MAX_STR] = "\0", mv_script_file[MAX_STR] = "mv "; // file name for verilog file
    char module_file[MAX_STR] = "./SubModules/"; // file name for sub module
    char *line = NULL; // line buffer
    size_t len = 0; // length of line returned by getline()
    FILE *fdesign = NULL, *fmodule = NULL, *fscript = NULL; // file pointers
    extern unsigned char debug_mode; // disable debug mode by default
    extern char project_path[MAX_STR]; // project path

    if(debug_mode) program_log(0x13030100); // program log
    
    // open synthesized design netlist
    strcpy(para_str, file_name);
    fdesign = fopen(para_str, "r");
    if (!fdesign){
        printf("%sInput file open error in sub_modules()%s\n", KRED,BLUE);
	
        program_log(0x13030101); // program error status
        return ERR_IN;
    }
    
    // create script file
    remove_extension(para_str, '.');
    strcat(para_str, ".sc");
    fscript = fopen(para_str, "w");
    if (!fscript){
        printf("%sScript file open error in sub_modules()%s\n", KRED, BLUE);
        fclose(fdesign);

        program_log(0x13030102); // program error status
        return ERR_OUT;
    }

    // move script file
    strcat(mv_script_file, para_str);
    strcat(mv_script_file, " ");
    strcat(mv_script_file, file_name);
    remove_extension(mv_script_file, '/'); // cd ..
    remove_extension(mv_script_file, '/'); // cd ..
    strcat(mv_script_file, "/Scripts/"); // add '/Scripts/' to path
    system(mv_script_file); // move script file
    
    while(fscanf(fdesign, "%s", keyword) != EOF){
    	if(strcmp(keyword, "module") == 0){// a new module found
            strcpy(module_file, project_path); // set file path
            strcat(module_file, "/SubModules/"); // add '/SubModules/' to path
    		fscanf(fdesign, "%s", module_name); // get the module name
            strcat(module_file, module_name); // copy to a new variable for processing            

            for(ptr = 0; ptr < strlen(module_file); ptr++) // module names may be connected with '('
                if(module_file[ptr] == '(') module_file[ptr] = '\0'; // in case of module_name(sig, ...

            strcat(module_file, ".v"); // file name for the module
            
            // create separate file for sub module
    		fmodule = fopen(module_file, "w");
    		if(!fmodule){
    			printf("%sOutput file %s open error in sub_modules()%s\n", KRED, module_file, BLUE);
    			fclose(fdesign);
    			fclose(fscript);
			
			program_log(0x13030103); // program error status
        		return ERR_OUT;
    		}
    		
    		strcat(keyword, " "); // add a space between the keyword module and module name
    		strcat(keyword, module_name); // connect the keyword module and module name
    		
    		while(strcmp(keyword, "endmodule") != 0){
    			fprintf(fmodule, "%s ", keyword);
    			
        		do{
        			getline(&line, &len, fdesign); // read a line and output as it is
        			fprintf(fmodule, "%s", line);
        			
                    // this is to check if the last character is ';'
        			ptr = strlen(line) - 1;
        			if(line[ptr] == '\n') ptr--;
        			if(line[ptr] == '\r') ptr--;
        		}while(line[ptr] != ';');
    		
    			fscanf(fdesign, "%s", keyword); // get the next line
    		}
    		fprintf(fmodule, "endmodule\r\n");
    		
    		fclose(fmodule); // sub module file write complete
    		
    		fprintf(fscript, "stat_xilinx %s\n", module_file); // add sub module file to read list
    	}
    }
    
    // add to flow analysis script
    /*
    fprintf(fscript, "set_top top_module_name\n");
    fprintf(fscript, "build_hierarchy\n");
    fprintf(fscript, "check_hierarchy\n");
    fprintf(fscript, "read_network\n");
    fprintf(fscript, "flow_fanout property_file.prin\n");
    */
    
    // now close the Verilog design and script files
    fclose(fdesign);
    fclose(fscript);    
    
    return status;
}
