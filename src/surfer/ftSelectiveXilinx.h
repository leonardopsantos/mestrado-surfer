/** \file ftSelectiveXilinx.h
    \brief Creates the selective DWC
    \author Leonardo Pereira Santos <leonardo.santos@restinga.ifrs.edu.br>
*/

#include "circuit.h"

class ftSelectiveXilinx {

public:
	ftSelectiveXilinx(int maxsize);
	int buildFtSelectiveCirc(Circuit &synth_circ, Circuit &circ_cpy0, Circuit &circ_cpy1);

protected:
	int maxsize;	//!< Number of Nets to be selected to comparison
};
