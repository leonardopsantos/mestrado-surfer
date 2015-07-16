/*************************************************************************/
/*
 *  Parser for Xilinx post-synthesis netlist
 *  by Gabriel Luca Nazar <glnazar@inf.ufrgs.br>
 *
 */
/*************************************************************************/

#ifndef _INCLUDED_XSYNTHPARSER_H_
#define _INCLUDED_XSYNTHPARSER_H_

#include <map>

#include "common.h"
#include "circuit.h"

#define BUF_SIZE 4096

class XSynthParser {
	protected:
		map<string, Net*> symbolTable;
		unsigned nextNet;
		unsigned nextComp;
		unsigned nextLut;
		void getNetName(char *src, char *dst);
		static compType string2type(char *src);
		static void parseTable(char *src, vector<bool> &table);
		void bufCleanup(Net* driver, Net* load);
	public:
		void parse(char *filename, Circuit &circ);
		void ParseSignal(std::string line, int id, Circuit &circ);
		static Component* ComponentFactory(std::string line, ifstream &inFile, int id);
};

#endif
