/** \file XDWSFOut.cpp
    \brief Code for Duplication With Comparison Selective.

    Code for Duplication With Comparison Selective technique.
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

//	for(int i = 0; i <= depth; i++) {
//		cout << "    ";
//	}
//	cout << "Net : " << net->name << "\n";

	if( net->isPI == true )
		return;

	Component* input = net->input;

//	for(int i = 0; i <= depth; i++) {
//		cout << "    ";
//	}

	if( input->type == LUT || input->type == LUT5 || input->type == LUT6 ) {

		std::pair<Net*, int> p = std::make_pair(po, depth);
//		cout << "  LUT " << input->name << " " << p.first->name << " ( depth=" << p.second << " )\n";
		input->logicConePOs.push_back(p);

		po->luts.push_back(std::make_pair(input, depth));
	} else {
//		cout << "  Comp " << input->name << "\n";
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

//	for(lut_it = circIn.luts.begin(); lut_it < circIn.luts.end(); lut_it++) {
//		Lut *l = *lut_it;
//		cout << "Lut " << l->name << "\n";
//
//		list<std::pair<Net*, int> >::iterator cone_it;
//
//		for(cone_it = l->logicConePOs.begin(); cone_it != l->logicConePOs.end(); cone_it++) {
//			cout << "\t " << cone_it->first->name << " (" << cone_it->second << ")\n";
//		}
//	}

	list<std::pair<Component*, int> >::iterator c_it;

//	for(net_it = circIn.POs.begin(); net_it < circIn.POs.end(); net_it++) {
//		Net* pNet = *net_it;
//		if( pNet->isPO == true ) {
//			cout << "PO "<< pNet->name << "\n";
//			for(c_it = pNet->luts.begin(); c_it != pNet->luts.end(); c_it++) {
//				cout << "\tLut " << c_it->first->name << "( " << c_it->second << ")\n";
//			}
//		}
//	}

	cout << "REMOVING...\n";

#if 0

	for(net_it = circIn.POs.begin(); net_it < circIn.POs.end(); net_it++) {
		Net* pNet = *net_it;

		if( pNet->isPO == false )
			continue;

		cout << "PO "<< pNet->name << "\n";

		list<std::pair<Component*, int> > copy_luts = pNet->luts;

		for(c_it = pNet->luts.begin(); c_it != pNet->luts.end(); c_it++) {
			if( c_it->first->logicConePOs.size() > 1 ) {
				copy_luts.remove(*c_it);
			}
		}

		for(c_it = copy_luts.begin(); c_it != copy_luts.end(); c_it++) {
			cout << "\tLut " << c_it->first->name << "( " << c_it->second << " )\n";
		}
	}



#else

	vector<Net*>::iterator po_it;

	for(po_it = circIn.POs.begin(); po_it < circIn.POs.end(); po_it++) {
		Net* pPo = *po_it;

		if( pPo->isPO == false )
			continue;

		list<std::pair<Component*, int> > copy_luts = pPo->luts;

		list<std::pair<Component*, int> >::iterator po_c_it;

		bool removed = false;

		for(po_c_it = pPo->luts.begin(); po_c_it != pPo->luts.end(); po_c_it++) {

//			cout << "PO "<< pPo->name << " PO Lut " << po_c_it->first->name << "( " << po_c_it->second << " )\n";

			removed = false;

			bool x_outputVector_2_81 = false;

//			if( po_c_it->first->name.compare("outputVector_2_81") == 0 )
//				x_outputVector_2_81 = true;

			for(net_it = circIn.POs.begin(); net_it < circIn.POs.end(); net_it++) {

				Net* pNet = *net_it;

//				cout << "PO "<< pPo->name << " PO Lut " << po_c_it->first->name << " Net "<< pNet->name << "\n";

				if( pNet->isPO == false || pNet == pPo )
					continue;

				for(c_it = pNet->luts.begin(); c_it != pNet->luts.end(); c_it++) {

//					cout << "PO "<< pPo->name << " PO Lut " << po_c_it->first->name << " Net "<< pNet->name << " Lut " << c_it->first->name << "( " << c_it->second << " )\n";

//					if( c_it->first->name.compare("outputVector_2_81") == 0 )
//						x_outputVector_2_81 = true;

					if( po_c_it->first == c_it->first /* && po_c_it->second == c_it->second */ ) {
//						cout << "                ==== >>  Removing " << c_it->first->name << "<< ====\n";
						copy_luts.remove(*po_c_it);
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

		for(c_it = copy_luts.begin(); c_it != copy_luts.end(); c_it++) {
			cout << "PO "<< pPo->name << " Lut " << c_it->first->name << "( " << c_it->second << " )\n";
		}
	}
#endif

	return;
}
