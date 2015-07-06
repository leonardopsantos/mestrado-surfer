/** \file XDWSFOut.cpp
    \brief Code for Duplication With Comparison Selective.

    Code for Duplication With Comparison Selective technique.

    \author Leonardo Pereira Santos <leonardo.santos@restinga.ifrs.edu.br>
*/

using namespace std;

#include <iostream>
#include <utility>

#include "XDWSFOut.h"

using namespace std;

/**
 * Builds a logic cone from each Primary Output
 * @param po Root Primary Output
 * @param net Current Net
 * @param node Node in graph from current Net
 * @param depth Current search depth
 */
void XDWSFOut::buildNetLogicConePOs(Net* po, Net* net, int depth) {

	if( net->isPI == true )
		return;

	Component* input = net->input;

	if( input->type == LUT || input->type == LUT5 || input->type == LUT6 ) {

		std::pair<Net*, int> p = std::make_pair(po, depth);
		input->logicConePOs.push_back(p);

		po->luts.push_back(std::make_pair(input, depth));
	}

	vector<Net*>::iterator net_it;

	for(net_it = input->inputs.begin(); net_it < input->inputs.end(); net_it++) {
		Net* pNet = *net_it;

		if( net->isPI == false )
			buildNetLogicConePOs(po, pNet, depth+1);
	}
}

void XDWSFOut::buildLogicCones(Circuit& circIn) {

	vector<Net*>::iterator net_it;

	for(net_it = circIn.POs.begin(); net_it < circIn.POs.end(); net_it++) {
		Net* pNet = *net_it;
		if( pNet->isPO == true ) {
			if( pNet->isPI == false )
				buildNetLogicConePOs(pNet, pNet, 0);
		}
	}

	vector<Lut*>::iterator lut_it;

	list<std::pair<Component*, int> >::iterator c_it;

	vector<Net*>::iterator po_it;

	for(po_it = circIn.POs.begin(); po_it < circIn.POs.end(); po_it++) {
		Net* pPo = *po_it;

		if( pPo->isPO == false )
			continue;

		pPo->exclusive_luts = pPo->luts;
		list<std::pair<Component*, int> >::iterator po_c_it;

		bool removed = false;

		for(po_c_it = pPo->luts.begin(); po_c_it != pPo->luts.end(); po_c_it++) {

			removed = false;

			for(net_it = circIn.POs.begin(); net_it < circIn.POs.end(); net_it++) {

				Net* pNet = *net_it;

				if( pNet->isPO == false || pNet == pPo )
					continue;

				for(c_it = pNet->luts.begin(); c_it != pNet->luts.end(); c_it++) {

					if( po_c_it->first == c_it->first ) {
						pPo->exclusive_luts.remove(*po_c_it);
						break;
					}
					if( removed == true )
						break;
				}
				if( removed == true )
					break;
			}
			if( removed == true )
				continue;
		}

		list<std::pair<Net*, int> >::iterator po_lut_it;

		for(c_it = pPo->exclusive_luts.begin(); c_it != pPo->exclusive_luts.end(); c_it++) {
			cout << "PO "<< pPo->name << " Lut " << c_it->first->name << "( " << c_it->second << " )\n";
			for( po_lut_it = c_it->first->logicConePOs.begin(); po_lut_it != c_it->first->logicConePOs.end(); po_lut_it++) {
				cout << "    NET "<< po_lut_it->first->name << "\n";
			}
		}
	}

	return;
}

// netgen -intstyle ise -s 2  -pcf counter_timing.pcf -rpw 100 -tpw 0 -ar Structure -tm counter_timing -w -dir netgen/map -ofmt vhdl -sim counter_timing_map.ncd counter_timing_map.vhd

// /opt/Xilinx/13.4/ISE_DS/ISE/bin/lin64/netgen -intstyle ise -s 2  -pcf alu4.new.pcf -rpw 100 -tpw 0 -ar Structure -tm fault_inj_top -w -dir netgen/map -ofmt vhdl -sim alu4.new.map.ncd alu4.new_timing_map.vhd


