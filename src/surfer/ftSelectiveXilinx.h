/** \file ftSelectiveXilinx.h
    \brief Creates the selective DWC
    \author Leonardo Pereira Santos <leonardo.santos@restinga.ifrs.edu.br>
*/

#ifndef _FTSELECTIVEXILINX_H_
#define _FTSELECTIVEXILINX_H_


#include "circuit.h"

class ftSelectiveXilinx {

public:
	int maxsize;	//!< Number of Nets to be selected to comparison
	vector<Net*> selected_nets;

	ftSelectiveXilinx(int maxsize);
	int buildFtSelectiveCirc(Circuit &synth_circ, Circuit &circ_cpy0, Circuit &circ_cpy1);
};

#endif // _FTSELECTIVEXILINX_H_
