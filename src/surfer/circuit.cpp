/*************************************************************************/
/*
 *  Circuit description classes
 *  by Gabriel Luca Nazar <glnazar@inf.ufrgs.br>
 *
 */
/*************************************************************************/

#include <fstream>
#include <cstdio>

#include "circuit.h"

using namespace std;

void Component::print(FILE* outfile){
	printf("Can't print type %d\n", type);
	return;
}

Component::Component(){
	inputs.clear();
	outputs.clear();
	locX=-1;
	locY=-1;
	depth = 0;
	pred = NULL;
	checker = NULL;
	id = 0;
	type = UNKNOWN;
	return;
}

Component::~Component(){
	//cout << "deleting: " << name << "; id = " << id << endl;
}

/**
 * Print the LOC constrain for a component, prepend the instance description with the string a
 * @param a String to prepend to the instance description
 * @param file Output stream to write to
 */
void Component::printLOC(string a, ofstream& file)
{
	if( file.is_open() == false )
		return;

	// SLICE_X60Y152

	file << "INST \"" << a << this->name << "\" LOC=SLICE_X" << this->locX << "Y"<< this->locY << ";\n";
}

/*************************************************************************/
Net::~Net(){
	outputs.clear();
	name.clear();
}

Net::Net(string netName, unsigned netId){
	name.assign(netName);
	id = netId;
	value = VARSIG;
	input = NULL;
	outputs.clear();
	isPI = false;
	isPO = false;
}

void Net::setInput(Component* newInput, sigVal newVal){
	if(input != NULL || value != VARSIG){
		cout << "Multiple drivers on net " << name << endl;
		if(input != NULL)
			cout << "Old input: " << input->name << endl;
		cout << "New input: " << newInput->name << endl;
		exit(0);
	}
				
	input = newInput;
	value = newVal;
}

string Net::getName(){
	if(isPO){
		string internal("internal_"); //This is required when a PO is used inside the circuit as well
		internal += name;
		return internal;
	}
	
	return name;
}

/*************************************************************************/
Short::Short(unsigned compId){
	name.assign("short_ckt");
	id = compId;
	type = SHORT;
}

void Short::print(FILE* outfile){
	fprintf(outfile, "  %s <= %s;\n", outputs[0]->getName().c_str(), inputs[0]->getName().c_str());
}

/*************************************************************************/
Lut::~Lut(){
	cout << "deleting " << name << ", id = " << id << endl;
}

Lut::Lut(string newName, unsigned compId){
	name.assign(newName);
	id = compId;
	type = LUT;
	tableO6.clear();
	tableO5.clear();
}

void Lut::printTable(FILE* outfile){
	unsigned char hexdigit, shiftOne;
	int i;
	
	hexdigit = 0;
	shiftOne = inputs.size() == 1 ? 2 : 8;
	for(i=tableO6.size()-1; i>=0; i--){
		if(tableO6[i])
			hexdigit |= shiftOne;
		if(i % 4 == 0){ //time to print a character
			fprintf(outfile, "%X", hexdigit);
			hexdigit = 0;
			shiftOne = 8;
		} else {
			shiftOne = shiftOne >> 1;
		}
	}
}

void Lut::print(FILE* outfile){
	int i;
	
	fprintf(outfile, "  %s : LUT%ld\n", name.c_str(), inputs.size());
	fprintf(outfile, "    generic map (\n");
	fprintf(outfile, "      INIT => X\"");
	printTable(outfile);
	
	fprintf(outfile, "\"\n    )\n    port map (\n");
	
	for(i=0; i<inputs.size(); i++){
		fprintf(outfile, "      I%d => %s,\n", i, inputs[i]->getName().c_str());
	}
	fprintf(outfile, "      O => %s\n    );\n", outputs[0]->getName().c_str());
}

void Lut::print(FILE* outfile, map<Net*, Net*> &duplicatedNet){
	int i;
	
	fprintf(outfile, "  %s : LUT%ld\n", name.c_str(), inputs.size());
	fprintf(outfile, "    generic map (\n");
	fprintf(outfile, "      INIT => X\"");
	printTable(outfile);
	
	fprintf(outfile, "\"\n    )\n    port map (\n");
	
	for(i=0; i<inputs.size(); i++){
		if(duplicatedNet.count(inputs[i]) == 1)
			fprintf(outfile, "      I%d => %s,\n", i, duplicatedNet[inputs[i]]->getName().c_str());
		else
			fprintf(outfile, "      I%d => %s,\n", i, inputs[i]->getName().c_str());
	}
	fprintf(outfile, "      O => %s\n    );\n", outputs[0]->getName().c_str());
}

void Lut::print(FILE* outfile, map<Net*, Net*> &duplicatedNet, map<Net*, unsigned> &copyIdx, map<Net*, vector<Component*> > &rSplitLuts){
	int i;
	
	fprintf(outfile, "  %s : LUT%ld\n", name.c_str(), inputs.size());
	fprintf(outfile, "    generic map (\n");
	fprintf(outfile, "      INIT => X\"");
	printTable(outfile);
	
	fprintf(outfile, "\"\n    )\n    port map (\n");
	
	for(i=0; i<inputs.size(); i++)
		if(inputs[i]->isPI) {
			fprintf(outfile, "      I%d => %s,\n", i, inputs[i]->getName().c_str());
		} else {
			if(copyIdx.count(inputs[i]) == 0){
				//not printed in this group yet, prints the original Net
				fprintf(outfile, "      I%d => %s,\n", i, inputs[i]->getName().c_str());
				//and marks the printing
				copyIdx[inputs[i]] = 0;
			} else {
				//already printed..
				//if it has no split copies or they were all used
				if(rSplitLuts.count(inputs[i]) == 0 || rSplitLuts[inputs[i]].size() <= copyIdx[inputs[i]]){
					//time to print the duplicated net (it MUST have one, in this case)
					if(duplicatedNet.count(inputs[i]) == 0){
						cout << "problem at LUT " << name << ", input " << inputs[i]->name << ", id = " << inputs[i]->id << endl;
						exit(0);
					}
					fprintf(outfile, "      I%d => %s,\n", i, duplicatedNet[inputs[i]]->getName().c_str());
				} else {
					//prints the next copy and increases the counter
					fprintf(outfile, "      I%d => %s,\n", i, rSplitLuts[inputs[i]][copyIdx[inputs[i]]]->outputs[0]->getName().c_str());
					copyIdx[inputs[i]] += 1;
				}
			}
		}
	fprintf(outfile, "      O => %s\n    );\n", outputs[0]->getName().c_str());
}
//checker printer
void Lut::printChecker(FILE* outfile, map<Net*, vector<Component*> > &rSplitLuts){
	int i;
	
	fprintf(outfile, "  %s : LUT%ld\n", name.c_str(), inputs.size());
	fprintf(outfile, "    generic map (\n");
	fprintf(outfile, "      INIT => X\"");
	printTable(outfile);
	
	fprintf(outfile, "\"\n    )\n    port map (\n");
	
	//the checker should always take the last copy available
	for(i=0; i<inputs.size(); i++)
		if(inputs[i]->isPI) {
			fprintf(outfile, "      I%d => %s,\n", i, inputs[i]->getName().c_str());
		} else {
			if(rSplitLuts.count(inputs[i]) == 0) //input with no copy whatsoever (MUST be the parity/copy net)
				fprintf(outfile, "      I%d => %s,\n", i, inputs[i]->getName().c_str());
			else
				fprintf(outfile, "      I%d => %s,\n", i, rSplitLuts[inputs[i]][rSplitLuts[inputs[i]].size()-1]->outputs[0]->getName().c_str());	
		}
	fprintf(outfile, "      O => %s\n    );\n", outputs[0]->getName().c_str());
}

//prints a direct checker (4-adj or unpaired-5)
void Lut::printDAdjCheck(FILE* outfile, map<Net*, Net*> &duplicatedNet, map<Net*, vector<Component*> > &rSplitLuts){
	int i;
	
	fprintf(outfile, "  %s : LUT%ld\n", name.c_str(), inputs.size());
	fprintf(outfile, "    generic map (\n");
	fprintf(outfile, "      INIT => X\"");
	printTable(outfile);
	
	fprintf(outfile, "\"\n    )\n    port map (\n");
	
	//the checker should always take the last copy available
	for(i=0; i<inputs.size(); i++){
		if(duplicatedNet.count(inputs[i])){ //this is an input to the group, NOT the outputs of one of the protected LUTs
			fprintf(outfile, "      I%d => %s,\n", i, duplicatedNet[inputs[i]]->getName().c_str());
			continue;
		}
		
		if(rSplitLuts.count(inputs[i]) == 1){ //this may be an input to the group or one of the protected nets
			fprintf(outfile, "      I%d => %s,\n", i, rSplitLuts[inputs[i]][rSplitLuts[inputs[i]].size()-1]->outputs[0]->getName().c_str());
			continue;
		}
		//this may be a PI or a protected net
		fprintf(outfile, "      I%d => %s,\n", i, inputs[i]->getName().c_str());
	}
	fprintf(outfile, "      O => %s\n    );\n", outputs[0]->getName().c_str());
}
/*************************************************************************/
Buf::Buf(string newName, unsigned compId){
	name.assign(newName);
	id = compId;
	type = BUF;
}

void Buf::print(FILE* outfile){
	fprintf(outfile, "  %s : BUF\n", name.c_str());
	fprintf(outfile, "    port map (\n");
	fprintf(outfile, "      I => %s,\n", inputs[0]->getName().c_str());
	fprintf(outfile, "      O => %s\n    );\n", outputs[0]->getName().c_str());
}

/*************************************************************************/
Mux::Mux(string newName, unsigned compId){
	name.assign(newName);
	id = compId;
	type = MUX;
}

void Mux::print(FILE* outfile){
	
	switch(type){
		case MUXCY:
			fprintf(outfile, "  %s : MUXCY\n", name.c_str());
			break;
		case MUXF7:
			fprintf(outfile, "  %s : MUXF7\n", name.c_str());
			break;
		case MUXF8:
			fprintf(outfile, "  %s : MUXF8\n", name.c_str());
			break;
		default:
			printf("Unexpected MUX type %d\n", type);
	}
	
	fprintf(outfile, "    port map (\n");
	
	if(type == MUXCY){
		fprintf(outfile, "      CI => %s,\n", inputs[0]->getName().c_str());
		fprintf(outfile, "      DI => %s,\n", inputs[1]->getName().c_str());
	} else {
		fprintf(outfile, "      I0 => %s,\n", inputs[0]->getName().c_str());
		fprintf(outfile, "      I1 => %s,\n", inputs[1]->getName().c_str());
	}
	
	fprintf(outfile, "      S => %s,\n", inputs[2]->name.c_str());
	fprintf(outfile, "      O => %s\n    );\n", outputs[0]->getName().c_str());
	
}

/*************************************************************************/
Adder::Adder(string newName, unsigned compId){
	name.assign(newName);
	id = compId;
	type = ADDER;
}

void Adder::print(FILE* outfile){
	int i;
	fprintf(outfile, "  %s : CARRY4\n", name.c_str());
	fprintf(outfile, "    port map (\n");
	fprintf(outfile, "      CI => %s,\n", inputs[0]->getName().c_str());
	fprintf(outfile, "      CYINIT => %s,\n", inputs[1]->getName().c_str());	
	for(i=3; i>=0; i--)
		fprintf(outfile, "      DI(%d) => %s,\n", i, inputs[i+2]->getName().c_str());
	
	for(i=3; i>=0; i--)
		fprintf(outfile, "      S(%d) => %s,\n", i, inputs[i+6]->getName().c_str());
	
	for(i=3; i>=0; i--)
		fprintf(outfile, "      O(%d) => %s,\n", i, outputs[i]->getName().c_str());
	
	for(i=3; i>=1; i--)
		fprintf(outfile, "      CO(%d) => %s,\n", i, outputs[i+4]->getName().c_str());
	fprintf(outfile, "      CO(0) => %s\n", outputs[4]->getName().c_str());
	
	fprintf(outfile, "    );\n");
}

/*************************************************************************/
Xor::Xor(string newName, unsigned compId){
	name.assign(newName);
	id = compId;
	type = XORCY;
}

void Xor::print(FILE* outfile){
	fprintf(outfile, "  %s : XORCY\n", name.c_str());
	fprintf(outfile, "    port map (\n");
	fprintf(outfile, "      CI => %s,\n", inputs[0]->getName().c_str());
	fprintf(outfile, "      LI => %s,\n", inputs[1]->getName().c_str());
	fprintf(outfile, "      O => %s\n    );\n", outputs[0]->getName().c_str());	
}

/*************************************************************************/
Inv::Inv(string newName, unsigned compId){
	name.assign(newName);
	pred = NULL;
	checker = NULL;
	id = compId;
	type = INV;
	inputs.clear();
	outputs.clear();
	locX=-1;
	locY=-1;
	depth = 0;
}

/*************************************************************************/
FlipFlop::FlipFlop(string newName, unsigned compId, compType ffType){
	name.assign(newName);
	id = compId;
	type = ffType;
}

void FlipFlop::print(FILE* outfile){
	switch(type){
		case FDR:
			fprintf(outfile, "  %s : FDR\n", name.c_str());
			fprintf(outfile, "    port map (\n");
			fprintf(outfile, "      C => %s,\n", inputs[0]->getName().c_str());
			fprintf(outfile, "      D => %s,\n", inputs[1]->getName().c_str());
			fprintf(outfile, "      R => %s,\n", inputs[2]->getName().c_str());
			fprintf(outfile, "      Q => %s\n    );\n", outputs[0]->getName().c_str());
			break;
		case FDRS:
			fprintf(outfile, "  %s : FDRS\n", name.c_str());
			fprintf(outfile, "    port map (\n");
			fprintf(outfile, "      C => %s,\n", inputs[0]->getName().c_str());
			fprintf(outfile, "      D => %s,\n", inputs[1]->getName().c_str());
			fprintf(outfile, "      R => %s,\n", inputs[2]->getName().c_str());
			fprintf(outfile, "      S => %s,\n", inputs[3]->getName().c_str());
			fprintf(outfile, "      Q => %s\n    );\n", outputs[0]->getName().c_str());
			break;
		case FDRSE:
			fprintf(outfile, "  %s : FDRSE\n", name.c_str());
			fprintf(outfile, "    port map (\n");
			fprintf(outfile, "      C => %s,\n", inputs[0]->getName().c_str());
			fprintf(outfile, "      CE => %s,\n", inputs[1]->getName().c_str());
			fprintf(outfile, "      D => %s,\n", inputs[2]->getName().c_str());
			fprintf(outfile, "      R => %s,\n", inputs[3]->getName().c_str());
			fprintf(outfile, "      S => %s,\n", inputs[4]->getName().c_str());
			fprintf(outfile, "      Q => %s\n    );\n", outputs[0]->getName().c_str());
			break;
		case FDRE:
			fprintf(outfile, "  %s : FDRE\n", name.c_str());
			fprintf(outfile, "    port map (\n");
			fprintf(outfile, "      C => %s,\n", inputs[0]->getName().c_str());
			fprintf(outfile, "      CE => %s,\n", inputs[1]->getName().c_str());
			fprintf(outfile, "      D => %s,\n", inputs[2]->getName().c_str());
			fprintf(outfile, "      R => %s,\n", inputs[3]->getName().c_str());
			fprintf(outfile, "      Q => %s\n    );\n", outputs[0]->getName().c_str());
			break;
		default:
			printf("Unknown FF type %d\n", type);
	}	

}

void Circuit::printLutsFanout(void) {


//	std::sort(nets.begin(), nets.end(), Net::fanoutCompare());


//	cout << "LUTs = " << luts.size() << "\n";

	vector<Lut*>::iterator lut_it;
	vector<Net*>::iterator net_it;

	int max;
	max = 0;

	for(lut_it = luts.begin(); lut_it < luts.end(); lut_it++) {
		Lut *l = *lut_it;
//		cout << "Lut "<< l->name << "fanout " << l->outputs.size() << "\n";
		for(net_it = l->outputs.begin(); net_it < l->outputs.end(); net_it++) {
			Net* pNet = *net_it;
			if( pNet->outputs.size() > 0 && pNet->outputs.size() > max )
				max = pNet->outputs.size();
		}
	}

	std::vector<int> histogram(max+1);

	for(lut_it = luts.begin(); lut_it < luts.end(); lut_it++) {
		Lut *l = *lut_it;
//		cout << "Lut "<< l->name << "fanout " << l->outputs.size() << "\n";
		for(net_it = l->outputs.begin(); net_it < l->outputs.end(); net_it++) {
			Net* pNet = *net_it;
			if( pNet->outputs.size() > 0 ) {
				histogram[pNet->outputs.size()] += 1;
			} else if( pNet->isPO == true ) {
				histogram[1] += 1;
			} else {
				histogram[0] += 1;
			}
		}
	}

#if 0

	for(net_it = nets.begin(); net_it < nets.end(); net_it++) {
		Net* pNet = *net_it;
#if 0
		cout << "    net "<< pNet->name;
		if( pNet->isPI == true )
			cout << "(PI)";
		if( pNet->isPO == true )
			cout << "(PO)";
		if( pNet->input != NULL )
			cout << " driven by "<< pNet->input->name;
		if( pNet->outputs.size() > 0 )
			cout << " fanout "<< pNet->outputs.size() <<"\n";
		cout << "\n";
#endif

#if 0
		if( pNet->isPI == false  && pNet->isPO == false ) {
			count++;
			mean_fanout += pNet->outputs.size();
			if( pNet->outputs.size() > 0 && pNet->outputs.size() > max )
				max = pNet->outputs.size();
		}
	}
	std::vector<int> histogram(max+1);
	for(net_it = nets.begin(); net_it < nets.end(); net_it++) {
		Net* pNet = *net_it;
		if( pNet->isPI == false && pNet->isPO == false ) {
			if( pNet->outputs.size() > 0 )
				histogram[pNet->outputs.size()] += 1;
			else
				histogram[0] += 1;
		}
	}
#endif

#endif

	cout << "# GNUplot data for " << this->name <<"\n";
	cout << "# fanout\tfrequency\n";
	vector<int>::iterator iit;
	for(iit = histogram.begin(); iit < histogram.end(); iit++) {
		cout << "  "<< iit - histogram.begin() << "\t\t" << *iit << "\n";
	}
}

/**
 * Clears members
 */
void Circuit::clear() {
	this->components.clear();
	this->nets.clear();
	this->luts.clear();
	this->PIs.clear();
	this->POs.clear();
	this->clocks.clear();
	this->resets.clear();
	this->sets.clear();
	this->ffs.clear();
	this->vccNet = NULL;
	this->gndNet = NULL;
}

Component* Circuit::GetComponentByName(string name)
{
	vector<Component*>::iterator comp_it;

	for(comp_it = this->components.begin(); comp_it < this->components.end(); comp_it++) {
		Component *c = *comp_it;
		if( c->name == name )
			return c;
	}
	return NULL;
}

Lut* Circuit::GetLutByName(string name)
{
	vector<Lut*>::iterator lut_it;

	for(lut_it = this->luts.begin(); lut_it < this->luts.end(); lut_it++) {
		Lut *l = *lut_it;
		if( l->name == name )
			return l;
	}
	return NULL;
}

Net* Circuit::GetNetByName(string name)
{
	vector<Net*>::iterator net_it;

	for(net_it = this->nets.begin(); net_it < this->nets.end(); net_it++) {
		Net *n = *net_it;
		if( n->name == name )
			return n;
	}
	return NULL;
}

bool Component::RemoveInput(Net* val)
{
	vector<Net*>::iterator net_it;
	for(net_it = this->inputs.begin(); net_it < this->inputs.end(); net_it++) {
		Net *n = *net_it;
		if( val == n ) {
			this->inputs.erase(net_it);
			return true;
		}
	}
	return false;
}
