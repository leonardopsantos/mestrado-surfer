/**********************************************************
 *
 * Prints the VHDL output file
 * by Gabriel Luca Nazar <glnazar@inf.ufrgs.br>
 *
***********************************************************/

#include "print.h"

/*********************************************************************************************************************/

void print_header(FILE* vhdl){

	fprintf(vhdl, "library IEEE;\n");
	fprintf(vhdl, "use IEEE.STD_LOGIC_1164.ALL;\n");
	fprintf(vhdl, "use IEEE.STD_LOGIC_ARITH.ALL;\n");
	fprintf(vhdl, "use IEEE.STD_LOGIC_UNSIGNED.ALL;\n\n");
	
	fprintf(vhdl, "entity surfer_table is\n");
	fprintf(vhdl, "\tport (\n");
	fprintf(vhdl, "\t\tfaddr : out STD_LOGIC_VECTOR(23 downto 0);\n");
	fprintf(vhdl, "\t\terror : out STD_LOGIC;\n");
	fprintf(vhdl, "\t\tsignature : in STD_LOGIC_VECTOR(%d downto 0)\n", sig_size_po + sig_size_internal - 1);
	fprintf(vhdl, "\t);\n");
	fprintf(vhdl, "end surfer_table;\n");

	fprintf(vhdl, "architecture Behavioral of surfer_table is\n");
}

/*********************************************************************************************************************/

inline void print_signature(const vector<bool> &signature, FILE* vhdl){
	unsigned int i;
	
	for(i=0; i<signature.size(); i++)
		fprintf(vhdl, "%d", signature[i] ? 1 : 0);
}

/*********************************************************************************************************************/

void print_entry(unsigned int faddr, const vector<bool> &signature, FILE* vhdl){

	fprintf(vhdl, "conv_std_logic_vector(%d, 24) when signature = \"", idx2Faddr(faddr));
	
	print_signature(signature, vhdl);
	
	fprintf(vhdl, "\" else\n");
}

/*********************************************************************************************************************/
void printVhdl(char* circname, faddr2signsType faddr2signs, unsigned int best_static_out){
	FILE* vhdl;
	faddr2signsType::iterator itF2S;
	list<vector<bool> >::iterator itList;
	char filename[64];
	
	snprintf(filename, 64, "%s_full.vhd", circname);
	
	vhdl = fopen("table.vhd", "w");
	print_header(vhdl);
	fprintf(vhdl, "begin\n");
	fprintf(vhdl, "error <= '0' when signature = conv_std_logic_vector(0, %d) else '1';", SIG_SIZE);
	fprintf(vhdl, "faddr <= ");
	
	for(itF2S = faddr2signs.begin(); itF2S != faddr2signs.end(); itF2S++)
		for(itList = itF2S->second.begin(); itList != itF2S->second.end(); itList++)
			print_entry(itF2S->first, *itList, vhdl);
	
	fprintf(vhdl, "conv_std_logic_vector(%d, 24);\n", idx2Faddr(best_static_out));
	fprintf(vhdl, "end Behavioral;\n");
	
	fclose(vhdl);
}
