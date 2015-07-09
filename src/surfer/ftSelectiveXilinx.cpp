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
//	this->selected_nets = vector<std::pair<Net*, double> >(this->maxsize);
}

int ftSelectiveXilinx::buildFtSelectiveCirc(Circuit& synth_circ,
		Circuit& circ_cpy0, Circuit& circ_cpy1)
{
	vector<std::pair<Net*, double> > selected_nets(this->maxsize);
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
	for(sel_it = selected_nets.begin(); sel_it < selected_nets.end(); sel_it++) {
		sel_it->first = circ_cpy0.nets[0];
		sel_it->second = 999999;
	}

	vector<Component*>::iterator comp_it;
	Component *comp;

	vector<Net*>::iterator net_it;
	for(net_it = circ_cpy0.nets.begin(); net_it < circ_cpy0.nets.end(); net_it++) {
		Net *n = *net_it;

		if( n->isPO == true || n->isPI == true || n->input->type == BUF )
			continue;

		mean = 0;
		for(comp_it = n->outputs.begin(); comp_it < n->outputs.end(); comp_it++) {

			Component *synth_lut, *cpy1_lut;
			comp = *comp_it;

			if( comp->type == BUF )
				break;

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
//			cout << comp->locX <<",";

			if( minLoc.first > comp->locX ) {
				minLoc.first = comp->locX;
			}
			if( minLoc.second > comp->locY ) {
				minLoc.second = comp->locY;
			}
			if( maxLoc.first < comp->locX ) {
				maxLoc.first = comp->locX;
				maxLoc.second = comp->locY;
			}
			if( maxLoc.second < comp->locY ) {
				maxLoc.second = comp->locY;
			}
		}

		if( comp->type == BUF )
			continue;

		if( n->input->locX < 0 )
			cout << n->input->name << "   WHAAAAAAAATTTT ???\n";

		mean += n->input->locX;
//		cout << n->input->locX <<" : ";

		if( minLoc.first > n->input->locX ) {
			minLoc.first = n->input->locX;
			minLoc.second = n->input->locY;
		}
		if( minLoc.second > n->input->locY ) {
			minLoc.second = n->input->locY;
		}
		if( maxLoc.first < n->input->locX ) {
			maxLoc.first = n->input->locX;
			maxLoc.second = n->input->locY;
		}
		if( maxLoc.second < n->input->locY ) {
			maxLoc.second = n->input->locY;
		}

		mean /= n->outputs.size()+1; // don't forget the input

		sigma = 0;

		for(comp_it = n->outputs.begin(); comp_it < n->outputs.end(); comp_it++) {
			comp = *comp_it;

			sigma += (mean - comp->locX)*(mean - comp->locX);
		}

		sigma += (mean - comp->locX)*(mean - comp->locX);

		if( sigma == 0 )
			continue;

		sigma /= n->outputs.size()+1; // don't forget the input

		sigma = sqrt(sigma);

//		cout << "mean = " << mean << ", sigma = " << sigma << " , sigma/n = "<< (sigma/(n->outputs.size()+1)) << "\n";

		sigma = (sigma/(n->outputs.size()+1));

		for(sel_it = selected_nets.begin(); sel_it < selected_nets.end(); sel_it++) {
			if( sel_it->second > sigma ) {
				sel_it->first = n;
				sel_it->second = sigma;
				break;
			}
		}
	}

//	cout << circ_cpy0.name <<" min LOC = (" << minLoc.first << "," << minLoc.second << "), max LOC = ("
//			<< maxLoc.first << "," << maxLoc.second << ")\n";
//
//	cout << "Selected Nets:\n";
//	for(sel_it = selected_nets.begin(); sel_it < selected_nets.end(); sel_it++) {
//		cout << "    " << sel_it->first->name << " sigma : " << sel_it->second << " : ";
//		for(comp_it = sel_it->first->outputs.begin(); comp_it < sel_it->first->outputs.end(); comp_it++) {
//			comp = *comp_it;
//			cout << comp->locX <<",";
//		}
//		cout << sel_it->first->input->locX <<"\n";
//	}
//	cout << "\n";

//	for(sel_it = selected_nets.begin(); sel_it < selected_nets.end(); sel_it++) {
//		sel_it->first = circ_cpy0.nets[0];
//		sel_it->second = 999999;
//	}

	for(net_it = circ_cpy1.nets.begin(); net_it < circ_cpy1.nets.end(); net_it++) {
		Net *n = *net_it;

		if( n->isPO == true || n->isPI == true || n->input->type == BUF )
			continue;

		mean = 0;
		for(comp_it = n->outputs.begin(); comp_it < n->outputs.end(); comp_it++) {

			Component *synth_lut, *cpy1_lut;
			comp = *comp_it;

			if( comp->type == BUF )
				break;

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
//			cout << comp->locX <<",";

			if( minLoc.first > comp->locX ) {
				minLoc.first = comp->locX;
			}
			if( minLoc.second > comp->locY ) {
				minLoc.second = comp->locY;
			}
			if( maxLoc.first < comp->locX ) {
				maxLoc.first = comp->locX;
				maxLoc.second = comp->locY;
			}
			if( maxLoc.second < comp->locY ) {
				maxLoc.second = comp->locY;
			}
		}

		if( comp->type == BUF )
			continue;

		if( n->input->locX < 0 )
			cout << n->input->name << "   WHAAAAAAAATTTT ???\n";

		mean += n->input->locX;
//		cout << n->input->locX <<" : ";

		if( minLoc.first > n->input->locX ) {
			minLoc.first = n->input->locX;
			minLoc.second = n->input->locY;
		}
		if( minLoc.second > n->input->locY ) {
			minLoc.second = n->input->locY;
		}
		if( maxLoc.first < n->input->locX ) {
			maxLoc.first = n->input->locX;
			maxLoc.second = n->input->locY;
		}
		if( maxLoc.second < n->input->locY ) {
			maxLoc.second = n->input->locY;
		}

		mean /= n->outputs.size()+1; // don't forget the input

		sigma = 0;

		for(comp_it = n->outputs.begin(); comp_it < n->outputs.end(); comp_it++) {
			comp = *comp_it;

			sigma += (mean - comp->locX)*(mean - comp->locX);
		}

		sigma += (mean - comp->locX)*(mean - comp->locX);

		if( sigma == 0 )
			continue;

		sigma /= n->outputs.size()+1; // don't forget the input

		sigma = sqrt(sigma);

//		cout << "mean = " << mean << ", sigma = " << sigma << " , sigma/n = "<< (sigma/(n->outputs.size()+1)) << "\n";

		sigma = (sigma/(n->outputs.size()+1));

		for(sel_it = selected_nets.begin(); sel_it < selected_nets.end(); sel_it++) {
			if( sel_it->second > sigma ) {
				sel_it->first = n;
				sel_it->second = sigma;
				break;
			}
		}
	}

	cout << circ_cpy1.name <<" min LOC = (" << minLoc.first << "," << minLoc.second << "), max LOC = ("
			<< maxLoc.first << "," << maxLoc.second << ")\n";

	cout << "Selected Nets:\n";
	for(sel_it = selected_nets.begin(); sel_it < selected_nets.end(); sel_it++) {
		cout << "    " << sel_it->first->name << " sigma : " << sel_it->second << " : ";
		for(comp_it = sel_it->first->outputs.begin(); comp_it < sel_it->first->outputs.end(); comp_it++) {
			comp = *comp_it;
			cout << comp->locX <<",";
		}
		cout << sel_it->first->input->locX <<"\n";
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

		if( n->isPO == true || n->isPI == true || n->input->type == BUF )
			continue;

		for(comp_it = n->outputs.begin(); comp_it < n->outputs.end(); comp_it++) {

			comp = *comp_it;

			if( comp->type == BUF )
				break;

			dist[comp->locX-minLoc.first][comp->locY-minLoc.second] = '0';
		}
		if( comp->type == BUF )
			continue;

		dist[n->input->locX-minLoc.first][n->input->locY-minLoc.second] = '0';
	}

	for(net_it = circ_cpy1.nets.begin(); net_it < circ_cpy1.nets.end(); net_it++) {
		Net *n = *net_it;

		if( n->isPO == true || n->isPI == true || n->input->type == BUF )
			continue;

		for(comp_it = n->outputs.begin(); comp_it < n->outputs.end(); comp_it++) {

			comp = *comp_it;

			if( comp->type == BUF )
				break;

			dist[comp->locX-minLoc.first][comp->locY-minLoc.second] = '1';
		}
		if( comp->type == BUF )
			continue;

		dist[n->input->locX-minLoc.first][n->input->locY-minLoc.second] = '1';
	}

	for(sel_it = selected_nets.begin(); sel_it < selected_nets.end(); sel_it++) {
		dist[sel_it->first->input->locX-minLoc.first][sel_it->first->input->locY-minLoc.second] = '*';
	}

	for(i = 0; i < maxLoc.first; i++) {
		for(j = 0; j < maxLoc.second; j++) {
			cout << dist[i][j] << flush;
		}
		cout << "\n";
	}

	return 0;
}
