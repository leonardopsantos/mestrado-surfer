

#ifndef _INCLUDED_XDWSFOUT_H_
#define _INCLUDED_XDWSFOUT_H_

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <fstream>
#include <vector>
#include <list>
#include <map>

#include "circuit.h"
#include "ftSelectiveXilinx.h"
#include "common.h"
#include "XDWCCOut.h"

using namespace std;

class XDWSFOut : public XDWCCOut {
	public:
		void buildLogicCones(Circuit& circIn);
		void printOutput(ftSelectiveXilinx &ft, Circuit* circIn, const char* filename);
		void printLOC(Circuit &synth_circ, Circuit &circ_cpy0, Circuit &circ_cpy1);
		void printDWSFSelectedLOC(ftSelectiveXilinx& ft, Circuit& circ_cpy0, Circuit& circ_cpy1);
		void printDWSF(ftSelectiveXilinx &ft, Circuit* circIn);
		void printDeltaLOC(Circuit &synth_circ, Circuit &circ_cpy0, Circuit &circ_cpy1);

	private:
		void buildNetLogicConePOs(Net* po, Net* net, int depth);
};

#endif // _INCLUDED_XDWSFOUT_H_


