

#ifndef _INCLUDED_XMAPPARSER_H_
#define _INCLUDED_XMAPPARSER_H_

#include <map>
#include "common.h"
#include "circuit.h"

#include "XSynthParser.h"

#define BUF_SIZE 4096

class XMapParser: public XSynthParser {
	protected:
		map<string, Net*> symbolTable;
		unsigned nextNet;
		unsigned nextComp;
		unsigned nextLut;
		void getNetName(char *src, char *dst);
		static compType string2type(char *src);
		int parsePiPos(ifstream &inFile, Circuit &circ);
		int parseXY(Component *l, char *loc);
		int parseArchitecture(ifstream &inFile, Circuit &circ);

	public:
		int parse(char *synth_filename, Circuit &synth_circ, string &map_filename, Circuit &circ_cpy0, Circuit &circ_cpy1);
		int findSequence(ifstream &inFile, string seq, string *text_line);
};

#endif // _INCLUDED_XMAPPARSER_H_
