/** \file ftSelectiveXilinx.cpp
    \brief Creates the selective DWC
    \author Leonardo Pereira Santos <leonardo.santos@restinga.ifrs.edu.br>
*/

using namespace std;

#include <utility>
#include <iostream>

#include "ftSelectiveXilinx.h"

ftSelectiveXilinx::ftSelectiveXilinx(int maxsize)
{
	this->maxsize = maxsize;
}

int ftSelectiveXilinx::buildFtSelectiveCirc(Circuit& synth_circ,
		Circuit& circ_cpy0, Circuit& circ_cpy1)
{
	vector<std::pair<Net*, float> > selected_nets(this->maxsize);
	double mean, sigma;

	int i;
	cout << "-------buildFtSelectiveCirc Input circuit:\n";
	cout << " " << synth_circ.luts.size() << " LUTs\n";
	cout << " " << synth_circ.ffs.size() << " FFs\n";
	cout << " " << synth_circ.components.size() << " other components\n";
	cout << " " << synth_circ.PIs.size() << " PIs\n";
	cout << " " << synth_circ.POs.size() << " POs\n";
	cout << " " << synth_circ.nets.size() << " Nets\n";
	cout << "---------------------" << endl;

	vector<Component*>::iterator comp_it;
	Component *comp;

	vector<Net*>::iterator net_it;
	for(net_it = circ_cpy0.nets.begin(); net_it < circ_cpy0.nets.end(); net_it++) {
		Net *n = *net_it;

		if( n->isPO == true || n->isPI == true )
			continue;

		mean = 0;
		for(comp_it = n->outputs.begin(); comp_it < n->outputs.end(); comp_it++) {

			Component *synth_lut, *cpy1_lut;
			comp = *comp_it;

			synth_lut = synth_circ.GetLutByName(comp->name);
			if( synth_lut == NULL )
				synth_lut = synth_circ.GetComponentByName(comp->name);

			cpy1_lut = circ_cpy1.GetLutByName(comp->name);
			if( cpy1_lut == NULL )
				cpy1_lut = circ_cpy1.GetComponentByName(comp->name);

			if( synth_lut == NULL || cpy1_lut == NULL )
				return -1;

			if( comp->locX < 0 )
				cout << comp->name << "   WHAAAAAAAATTTT ???\n";

			mean += comp->locX;
			cout << comp->locX <<",";
		}

		if( n->input->locX < 0 )
			cout << n->input->name << "   WHAAAAAAAATTTT ???\n";

		mean += n->input->locX;
		cout << n->input->locX <<" : ";

		mean /= n->outputs.size()+1; // don't forget the input

		sigma = 0;

		for(comp_it = n->outputs.begin(); comp_it < n->outputs.end(); comp_it++) {
			comp = *comp_it;

			sigma += (mean - comp->locX)*(mean - comp->locX);
		}

		sigma += (mean - comp->locX)*(mean - comp->locX);

		sigma /= n->outputs.size()+1; // don't forget the input

		cout << "mean = " << mean << ", sigma = " << sigma << "\n";

		//std::pair<Net*, int> p = std::make_pair(n, 0.0);
	}

	return 0;
}
