/*************************************************************************/
/*
 *  Algorithmic P-CED insertion for Xilinx FPGAs
 *  by Gabriel Luca Nazar <glnazar@inf.ufrgs.br>
 *
 */
/*************************************************************************/

#ifndef _INCLUDED_FTXILINX_H_
#define _INCLUDED_FTXILINX_H_

#include <vector>
#include <set>
#include <list>
#include <cmath>
#include <algorithm>
#include <lemon/smart_graph.h>
#include <lemon/matching.h>
#include "circuit.h"
#include "common.h"

#define LUT_K 6
#define LARGE_THRESHOLD 500
#define VLARGE_THRESHOLD 1000

using namespace std;
using namespace lemon;

class ftXilinx {
	private:
		unsigned muxFxCheckers;
		unsigned nextErrorId;
		Lut* gen4AdjChecker(set<unsigned> &clique, char* name, vector<Lut*> &lutVec_in);
		Lut* genSharedChecker(const set<set<Component*> > &sCheck, char* name);
		Lut* genUnpairedCopy(set<unsigned> clique, char* name, vector<Lut*> &lutVec_in);
		Lut* genUnpairedCopy(Lut* origLut, char* name);
		Lut* genUnpairedDCheck(Lut* origLut, char* name);
		Lut* genParityPred(set<unsigned> clique, char* name, vector<Lut*> &lutVec_in);
		Lut* genParityPred(set<Component*> clique, char* name);
		Lut* genParityCheck(set<unsigned> clique, Net *pNet, char* name, vector<Lut*> &lutVec_in);
		Lut* genMuxFxChecker(Component* comp, char* name);
		Lut* genPOChecker(vector<Net*> &POVec, char *name);
		Mux* duplicateMuxFx(Component* origMux, unsigned nextDWCId);
		FlipFlop* duplicateFF(FlipFlop* ff);
		void genAdderCheckers(list<Net*> &netsWithLoad, list<Lut*> &checkerLuts);
		void generateDuplicatedAdders();
		void reorderTable(Lut* l, const set<Net*> &inputSet, vector<bool> &table);
		
		bool isLarge;
		bool isVLarge;
		
		vector<vector<set<unsigned> > > cliques6; //set of cliques using LUT_K-adjacencies
		vector<vector<set<unsigned> > > cliquesMuxFx; //set of cliques using (LUT_K+1)-adjacencies
		
		void generateProximityVectors(vector<vector<set<unsigned> > > &selectedCliques_in, vector<Lut*> &lutVec_in, vector<vector<int> > &proximity1, vector<vector<int> > &proximity2);
		unsigned getProximityFactor(const set<unsigned> &clique1, const set<unsigned> &clique2, vector<Lut*> &lutVec_in);
		vector<vector<int> > proximity2General; //proximity factor between 2-cliques
		vector<vector<int> > proximity1General; //proximity factor between a 1-cliques
		vector<vector<int> > proximity2MUXFX; //proximity factor between 2-cliques
		vector<vector<int> > proximity1MUXFX; //proximity factor between a 1-cliques
		void idSet2PtSet(set<unsigned> &idSet, set<Component*> &compSet, vector<Lut*> &lutVec_in);
		void generateSharedCheckers(vector<vector<set<unsigned> > > &selectedCliques_in, vector<Lut*> &lutVec_in, vector<vector<int> > &proximity1, vector<vector<int> > &proximity2);
		
		Circuit *circ; //input circuit
		
		void findCliques(vector<vector<set<unsigned> > > &cliques6_in, vector<Lut*> &lutVec_in, int maxSize); //finds k-cliques in the graph (with k in 3..LUT_K-1)
		void addInputs(set<unsigned> &inputSet, Lut* l);
		
		void buildDWC(vector<vector<set<unsigned> > > &selectedCliques_in, vector<Lut*> &lutVec_in); //Fine-Grained DWC circuit builder
		
		unsigned int cost();
		void costFromAdders(unsigned *retCost, unsigned *errorsCnt); //calculates the cost due to duplicated adders
		void setCover(vector<vector<set<unsigned> > > &selectedCliques_in, vector<vector<set<unsigned> > > &cliques6_in, vector<Lut*> &lutVec_in, int maxSize);
		void updateCoverVec(vector<vector<unsigned char> > &coverVec, vector<bool> &visitedSize, set<unsigned> &clique, vector<vector<set<unsigned> > > &cliques, int maxSize);
		void checkSolution();

		void findMuxesWithConstInput();
		void findAdders();
		void removeAdders();
		void generateDuplicatedMuxFx();
		void generateDuplicatedNets();
		void generateDuplicatedFFs();
		void generateMuxCheckers();
		void generateCED(vector<vector<set<unsigned> > > &selectedCliques_in, vector<Lut*> &lutVec_in, int maxSize);
		void generateCChainCED(vector<vector<set<unsigned> > > &selectedCliques_in, vector<Lut*> &lutVec_in);
		void splitRouting();
		void removeMuxFxLUTs();
		void calculateAllDepths(vector<Lut*> &lutsVec);
		void calculateDepth(Component* comp);
		float depthByType(compType type);
		void sortByDepth(vector<Lut*> &lutVec_in);
		void insertOutputCmp();
		
		void fetchInfo();
		
		list<set<set<Component*> > > sharedCheckers;
	public:
		ftXilinx(Circuit* newCirc); //class constructor
		void buildFtCirc(); //build fault tolerant circuit
	
		vector<vector<set<unsigned> > > selectedCliques; //cliques selected during search phase
		vector<vector<set<unsigned> > > selectedCliquesMuxFx; //cliques selected during search phase
		unsigned errorsCnt; //amount of error signals
		
		list<Lut*> adderCheckers;
		list<set<Component*> > adders;
		
		list<Lut*> unpairedDCheck; //unpaired LUT with less than K inputs (that can use direct checking)
		
		unsigned splitLutsCnt;
		map<Net*, vector<Component*> > rSplitLuts;
			
		map<Net*, Net*> duplicatedNet; //Maps a net to its copy, if it has one
		vector<Mux*> duplicatedMuxFx; //Muxes (F7 and F8) that were duplicated
		vector<FlipFlop*> duplicatedFFs; //Duplicated FFs
		
		vector<Lut*> lutsWithMuxF7;
		
		unsigned maxCheckerSize; //the maximum checker size to be used when usign carry chain checking
		unsigned maxGroupSize; //the maximum size of a parity group
		
		list<vector<Lut*> > cChainGroups;
		list<vector<Adder*> > cChainCheckers;
		
		unsigned stackedCheckerCnt;
		unsigned nextPredId;
		unsigned nextCChainNetId;
		
		set<Lut*> forceDuplicate;
		
		list<Lut*> POCheckers;
		
		int rstPICnt;
};

#endif
