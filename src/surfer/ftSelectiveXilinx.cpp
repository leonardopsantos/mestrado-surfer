/** \file ftSelectiveXilinx.cpp
    \brief Creates the selective DWC
    \author Leonardo Pereira Santos <leonardo.santos@restinga.ifrs.edu.br>
*/

using namespace std;

#include <utility>
#include <iostream>
#include <math.h>

#include "ftSelectiveXilinx.h"

ftSelectiveXilinx::ftSelectiveXilinx(int maxsize)
{
	this->maxsize = maxsize;
	this->selected_nets = vector<Net*>(this->maxsize);
}

int ftSelectiveXilinx::buildFtSelectiveCirc(Circuit& synth_circ,
		Circuit& circ_cpy0, Circuit& circ_cpy1)
{
	vector<std::pair<Net*, double> > interesting_nets(this->maxsize);
	double mean, sigma;

	int i;
	std::pair<int, int> minLoc(999999, 999999);
	std::pair<int, int> maxLoc(0, 0);

	cout << "-------buildFtSelectiveCirc Input circuit:\n";
	cout << " " << synth_circ.luts.size() << " LUTs\n";
	cout << " " << synth_circ.ffs.size() << " FFs\n";
	cout << " " << synth_circ.components.size() << " other components\n";
	cout << " " << synth_circ.PIs.size() << " PIs\n";
	cout << " " << synth_circ.POs.size() << " POs\n";
	cout << " " << synth_circ.nets.size() << " Nets\n";
	cout << "---------------------" << endl;

	vector<std::pair<Net*, double> >::iterator sel_it;
	for(sel_it = interesting_nets.begin(); sel_it < interesting_nets.end(); sel_it++) {
		sel_it->first = circ_cpy0.nets[0];
		sel_it->second = 999999;
	}

	vector<Component*>::iterator comp_it;
	Component *cpy0_comp, *cpy1_comp;

	vector<Net*>::iterator net_it;
	for(net_it = circ_cpy0.nets.begin(); net_it < circ_cpy0.nets.end(); net_it++) {
		Net *cpy0_net = *net_it;

		if( cpy0_net->input == NULL )
			continue;

		if( cpy0_net->isPO == true || cpy0_net->isPI == true || cpy0_net->input->type == BUF )
			continue;

//		cout << cpy0_net->name <<" : ";

		mean = 0;
		for(comp_it = cpy0_net->outputs.begin(); comp_it < cpy0_net->outputs.end(); comp_it++) {

			cpy0_comp = *comp_it;

			if( cpy0_comp->type == BUF )
				break;

			cpy1_comp = circ_cpy1.GetLutByName(cpy0_comp->name);
			if( cpy1_comp == NULL )
				cpy1_comp = circ_cpy1.GetComponentByName(cpy0_comp->name);
			if( cpy1_comp == NULL )
				break;

			if( cpy0_comp->locX < 0 )
				cout << cpy0_comp->name << "   WHAAAAAAAATTTT ???\n";

			if( cpy1_comp->locX < 0 )
				cout << cpy1_comp->name << "   WHAAAAAAAATTTT ???\n";

			mean += cpy0_comp->locX;
//			cout << cpy0_comp->locX <<",";

			mean += cpy1_comp->locX;
//			cout << cpy1_comp->locX <<",";

			if( minLoc.first > cpy0_comp->locX ) {
				minLoc.first = cpy0_comp->locX;
			}
			if( minLoc.second > cpy0_comp->locY ) {
				minLoc.second = cpy0_comp->locY;
			}
			if( maxLoc.first < cpy0_comp->locX ) {
				maxLoc.first = cpy0_comp->locX;
			}
			if( maxLoc.second < cpy0_comp->locY ) {
				maxLoc.second = cpy0_comp->locY;
			}

			if( minLoc.first > cpy1_comp->locX ) {
				minLoc.first = cpy1_comp->locX;
			}
			if( minLoc.second > cpy1_comp->locY ) {
				minLoc.second = cpy1_comp->locY;
			}
			if( maxLoc.first < cpy1_comp->locX ) {
				maxLoc.first = cpy1_comp->locX;
			}
			if( maxLoc.second < cpy1_comp->locY ) {
				maxLoc.second = cpy1_comp->locY;
			}
		}

		if( cpy0_comp->type == BUF || cpy1_comp == NULL )
			continue;

		if( cpy0_net->input->locX < 0 )
			cout << cpy0_net->input->name << "   WHAAAAAAAATTTT ???\n";

		cpy1_comp = circ_cpy1.GetLutByName(cpy0_net->input->name);
		if( cpy1_comp == NULL )
			cpy1_comp = circ_cpy1.GetComponentByName(cpy0_net->input->name);
		if( cpy1_comp == NULL )
			continue;

		if( cpy1_comp->locX < 0 )
			cout << cpy1_comp->name << "   WHAAAAAAAATTTT ???\n";

		mean += cpy0_net->input->locX;
//		cout << cpy0_net->input->locX <<",";

		mean += cpy1_comp->locX;
//		cout << cpy1_comp->locX <<" : ";

		if( minLoc.first > cpy0_net->input->locX ) {
			minLoc.first = cpy0_net->input->locX;
			minLoc.second = cpy0_net->input->locY;
		}
		if( minLoc.second > cpy0_net->input->locY ) {
			minLoc.second = cpy0_net->input->locY;
		}
		if( maxLoc.first < cpy0_net->input->locX ) {
			maxLoc.first = cpy0_net->input->locX;
			maxLoc.second = cpy0_net->input->locY;
		}
		if( maxLoc.second < cpy0_net->input->locY ) {
			maxLoc.second = cpy0_net->input->locY;
		}

		if( minLoc.first > cpy1_comp->locX ) {
			minLoc.first = cpy1_comp->locX;
		}
		if( minLoc.second > cpy1_comp->locY ) {
			minLoc.second = cpy1_comp->locY;
		}
		if( maxLoc.first < cpy1_comp->locX ) {
			maxLoc.first = cpy1_comp->locX;
			maxLoc.second = cpy1_comp->locY;
		}
		if( maxLoc.second < cpy1_comp->locY ) {
			maxLoc.second = cpy1_comp->locY;
		}

		mean /= 2*(cpy0_net->outputs.size()+1); // don't forget the input

		sigma = 0;

		for(comp_it = cpy0_net->outputs.begin(); comp_it < cpy0_net->outputs.end(); comp_it++) {
			cpy0_comp = *comp_it;

			sigma += (mean - cpy0_comp->locX)*(mean - cpy0_comp->locX);

			cpy1_comp = circ_cpy1.GetLutByName(cpy0_comp->name);
			if( cpy1_comp == NULL )
				cpy1_comp = circ_cpy1.GetComponentByName(cpy0_comp->name);

			sigma += (mean - cpy1_comp->locX)*(mean - cpy1_comp->locX);
		}

		sigma += (mean - cpy0_net->input->locX)*(mean - cpy0_net->input->locX);

		if( sigma == 0 )
			continue;

		cpy1_comp = circ_cpy1.GetLutByName(cpy0_net->input->name);
		if( cpy1_comp == NULL )
			cpy1_comp = circ_cpy1.GetComponentByName(cpy0_net->input->name);

		sigma += (mean - cpy1_comp->locX)*(mean - cpy1_comp->locX);

		sigma /= 2*(cpy0_net->outputs.size()+1); // don't forget the input

		sigma = sqrt(sigma);

//		cout << "mean = " << mean << ", sigma = " << sigma << " , sigma/n = "<< (sigma/(2*(cpy0_net->outputs.size()+1))) << "\n";

		sigma = (sigma/(2*(cpy0_net->outputs.size()+1)));

		for(sel_it = interesting_nets.begin(); sel_it < interesting_nets.end(); sel_it++) {
			if( sel_it->second > sigma ) {
				sel_it->first = cpy0_net;
				sel_it->second = sigma;
				break;
			}
		}
	}

//	cout << circ_cpy0.name <<" min LOC = (" << minLoc.first << "," << minLoc.second << "), max LOC = ("
//			<< maxLoc.first << "," << maxLoc.second << ")\n";
//
//	cout << "Selected Nets:\n";
//	for(sel_it = interesting_nets.begin(); sel_it < interesting_nets.end(); sel_it++) {
//		cout << "    " << sel_it->first->name << " sigma : " << sel_it->second << " : ";
//		for(comp_it = sel_it->first->outputs.begin(); comp_it < sel_it->first->outputs.end(); comp_it++) {
//			cpy0_comp = *comp_it;
//			cout << cpy0_comp->locX <<",";
//		}
//		cout << sel_it->first->input->locX <<"\n";
//	}
//	cout << "\n";

//	for(sel_it = interesting_nets.begin(); sel_it < interesting_nets.end(); sel_it++) {
//		sel_it->first = circ_cpy0.nets[0];
//		sel_it->second = 999999;
//	}

	for(i=0; i < interesting_nets.size(); i++) {
		this->selected_nets[i] = interesting_nets[i].first;
	}

	cout << circ_cpy1.name <<" min LOC = (" << minLoc.first << "," << minLoc.second << "), max LOC = ("
			<< maxLoc.first << "," << maxLoc.second << ")\n";

	cout << "Selected Nets:\n";
	char letter = 'A';
	for(sel_it = interesting_nets.begin(); sel_it < interesting_nets.end(); sel_it++) {
		cout << "    (" << letter++ << ") " << sel_it->first->name << " - sigma = " << sel_it->second << " : ";
		for(comp_it = sel_it->first->outputs.begin(); comp_it < sel_it->first->outputs.end(); comp_it++) {
			cpy0_comp = *comp_it;

			cout << cpy0_comp->locX <<",";

			cpy1_comp = circ_cpy1.GetLutByName(cpy0_comp->name);
			if( cpy1_comp == NULL )
				cpy1_comp = circ_cpy1.GetComponentByName(cpy0_comp->name);
			cout << cpy1_comp->locX <<",";
		}
		cout << sel_it->first->input->locX <<",";

		cpy1_comp = circ_cpy1.GetLutByName(sel_it->first->input->name);
		if( cpy1_comp == NULL )
			cpy1_comp = circ_cpy1.GetComponentByName(sel_it->first->input->name);
		cout << cpy1_comp->locX <<"\n";
	}
	cout << "\n";

	maxLoc.first -= minLoc.first;
	maxLoc.second -= minLoc.second;

	int j;
	char dist[maxLoc.first][maxLoc.second];

	for(i = 0; i < maxLoc.first; i++) {
		for(j = 0; j < maxLoc.second; j++) {
			dist[i][j] = '-';
		}
	}

	for(net_it = circ_cpy0.nets.begin(); net_it < circ_cpy0.nets.end(); net_it++) {
		Net *n = *net_it;

		if( n->input == NULL )
			continue;

		if( n->isPO == true || n->isPI == true ||n->input->type == BUF )
			continue;

		for(comp_it = n->outputs.begin(); comp_it < n->outputs.end(); comp_it++) {

			cpy0_comp = *comp_it;

			if( cpy0_comp->type == BUF )
				break;

			dist[cpy0_comp->locX-minLoc.first][cpy0_comp->locY-minLoc.second] = '0';
		}
		if( cpy0_comp->type == BUF )
			continue;

		dist[n->input->locX-minLoc.first][n->input->locY-minLoc.second] = '0';
	}

	for(net_it = circ_cpy1.nets.begin(); net_it < circ_cpy1.nets.end(); net_it++) {
		Net *n = *net_it;

		if( n->input == NULL )
			continue;

		if( n->isPO == true || n->isPI == true || n->input->type == BUF )
			continue;

		for(comp_it = n->outputs.begin(); comp_it < n->outputs.end(); comp_it++) {

			cpy0_comp = *comp_it;

			if( cpy0_comp->type == BUF )
				break;

			dist[cpy0_comp->locX-minLoc.first][cpy0_comp->locY-minLoc.second] = '1';
		}
		if( cpy0_comp->type == BUF )
			continue;

		dist[n->input->locX-minLoc.first][n->input->locY-minLoc.second] = '1';
	}

	letter = 'A';
	for(sel_it = interesting_nets.begin(); sel_it < interesting_nets.end(); sel_it++) {
		dist[sel_it->first->input->locX-minLoc.first][sel_it->first->input->locY-minLoc.second] = letter;

		cpy1_comp = circ_cpy1.GetLutByName(sel_it->first->input->name);
		if( cpy1_comp == NULL )
			cpy1_comp = circ_cpy1.GetComponentByName(sel_it->first->input->name);

		dist[cpy1_comp->locX-minLoc.first][cpy1_comp->locY-minLoc.second] = letter++;
	}

	for(j = maxLoc.second-1; j >= 0 ; j--) {
		for(i = 0; i < maxLoc.first; i++) {
			cout << dist[i][j] << flush;
		}
		cout << "\n";
	}

	return 0;
}
