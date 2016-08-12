#include "evaluator.h"

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>

using namespace std;

void parseStaticDeadlines(char *filename, map<unsigned int, unsigned int> &staticTable)
{

	string line;
	unsigned int slack;
	unsigned int deadline;

	ifstream inFile(filename);
	if (inFile.is_open()) {
		while ( 1 ) {
			if( inFile >> slack >> deadline ) {
				staticTable[slack] = deadline;
			} else
				break;
		}
		inFile.close();
	}
}

inline vector<bool> createCompSig(const vector<bool> &signature,
		vector<vector<unsigned> > &compTable)
{
	vector<bool> compSig;
	int i, j;

	compSig.resize(compTable.size());
	for(i=0; i<compSig.size(); i++){
		compSig[i] = false;
		for(j=0; j<compTable[i].size(); j++)
			compSig[i] = compSig[i] | signature[compTable[i][j]];
	}

	return compSig;
}

tableType createCompHistograms(tableType &signatureTable, transTableType &transTable,
		vector<vector<unsigned> > &compTable)
{
	tableType compSigTable;
	tableType::iterator it;
	vector<bool> compSig;
	vector<unsigned long long> compHist, rawHist;
	int i, j;

	compHist.resize(CONFIG_SIZE+1);

	for(i=min_idx; i<=max_idx; i++){
		compHist[i] = 0;
	}

	for(it = signatureTable.begin(); it != signatureTable.end(); ++it) {
		rawHist = it->second;
		compSig = createCompSig(it->first, compTable);
		for(i=min_idx; i<=max_idx; i++){
			compHist[i] += rawHist[i];
		}

		compSigTable[compSig] = compHist;
	}

	return compSigTable;
}

/**
 * from a slack, returns a best static starting frame, rounded down
 */
unsigned int getBSAddrBottom(map<unsigned int, unsigned int> &staticTable, unsigned int slack)
{
	if( slack <= 1000 ) {
		return staticTable[1000];
	} else if( slack > 1000 && slack <= 10000 ) {
		int s = (slack/1000)*1000;
		return staticTable[s];
	} else if( slack > 10000 && slack <= 60000 ) {
		int s = (slack/10000)*10000;
		return staticTable[s];
	}
	return -1;
}

/**
 * from a slack, returns a best static starting frame, rounded down
 */
unsigned int getBSAddrNearest(map<unsigned int, unsigned int> &staticTable, unsigned int slack)
{
	if( slack <= 1000 ) {
		return staticTable[1000];
	} else if( slack > 1000 && slack <= 10000 ) {
		int s = (slack/1000)*1000;
		return staticTable[s];
	} else if( slack > 10000 && slack <= 60000 ) {
		int s = (slack/10000)*10000;
		return staticTable[s];
	}
	return -1;
}

inline int calculateSlackCover(vector<unsigned long long> compHist, unsigned int bestStaticAddr, int frames)
{
	int i, j, c;
	c = 0;
	j = bestStaticAddr;
	for(i = 0; i < frames; i++) {
		if( j > max_idx ) {
			return c;
		}
		c+=compHist[j];
		j++;
	}
	return c;
}

#define BS_CRITERIA_BOTTOM	2
#define BS_CRITERIA_NEAREST	1

void calculateBestStaticRTCover(ofstream &outFile, vector<unsigned long long> compHist, map<unsigned int, unsigned int> &staticTable, int criteria)
{
	vector<int> coverage[2062];
	int i, j;
	int frames, slack;
	unsigned int bs;  // best static ;-)
	int cover;
	int Os; // histogram sum

	outFile << "min_idx = " << min_idx << ", max_idx = " << max_idx << "\n";
	cout << "min_idx = " << min_idx << ", max_idx = " << max_idx << "\n";

	Os = 0;
	for(i = min_idx; i <= max_idx; i++) {
		Os += compHist[i];
	}

	outFile << "cover " << Os << "\n";
	cout << "cover " << Os << "\n";

	// (60.000-FRAME_CYCLES-CMD_CYCLES)/FRAME_CYCLES = 1461
	// 1461 the number of frames that can be scrubbed in 600 us (or 60.000 clock cycles)
#if 1
	int last;
	for(frames = 1; frames < 1462; frames++) {
		slack = FRAME_CYCLES+CMD_CYCLES+FRAME_CYCLES*frames;
		if( criteria == BS_CRITERIA_BOTTOM )
			bs = getBSAddrBottom(staticTable, slack);
		else
			bs = getBSAddrNearest(staticTable, slack);
		cover = calculateSlackCover(compHist, bs, frames);
		last = bs+frames;
		if( last > max_idx )
			last = max_idx;
		outFile << "slack " << slack*10 << " " << bs << " " << last << " " << cover << " " << ((double)cover)/Os <<  "\n";
		cout << "slack " << slack*10 << " " << bs << " " << last << " " << cover << " " << ((double)cover)/Os <<  "\n";
	}
#endif

#if 0
	int deadline, step;
	step = 1000;
	bs = faddr2Idx(105230);

	for(deadline=1000; deadline<=60000; deadline += step){
		if(deadline == 10000)
			step = 10000;
		bs = staticTable[deadline];
		frames = (deadline-FRAME_CYCLES-CMD_CYCLES)/FRAME_CYCLES;
		cover = calculateSlackCover(compHist, bs, frames);
		outFile << frames << " " << bs << " " << cover << "\n";
		cout << deadline << " " << bs << " " << cover << "\n";
	}
#endif
}

vector<string> tokenize(string str, char sep)
{
	vector<string> tokens;

	string::size_type tokenOff = 0, sepOff = tokenOff;
	while (sepOff != string::npos)
	{
		sepOff = str.find(sep, sepOff);
		string::size_type tokenLen = (sepOff == string::npos) ? sepOff : sepOff++ - tokenOff;
		string token = str.substr(tokenOff, tokenLen);
		if (!token.empty())
			tokens.push_back(token);
			/* do something with token */;
		tokenOff = sepOff;
	}
	return tokens;
}

int main(int argc, char *argv[]){
	tableType signatureTable;
	transTableType transTable;
	vector<vector<unsigned> > compTable;
	map<unsigned int, unsigned int> slacksBestStaticTable;	// maps the relation between
															// the available slack and the
															// best static address
	tableType compSigTable;

	if(argc < 3){
		printf("Use %s <input_sig_file> <input_table_RT> <input best static deadlines file>\n", argv[0]);
		exit(0);
	}

	sig_size_internal = 1;
	sig_size_po = 1;


	vector<string> splitpath = tokenize(string(argv[1]), '/');
	vector<string> fn = tokenize(splitpath[splitpath.size()-1], '.');
	string benchmark = fn[0];

	parseTable(argv[2], transTable, compTable);
	parseInfile(argv[1], signatureTable);
	parseStaticDeadlines(argv[3], slacksBestStaticTable);

	compSigTable = createCompHistograms(signatureTable, transTable, compTable);

	for(tableType::iterator it = compSigTable.begin(); it != compSigTable.end(); ++it) {
		string filename = benchmark+"_bottom_bestStaticEval.txt";

		ofstream outFile;
		outFile.open (filename.c_str());

		calculateBestStaticRTCover(outFile, it->second, slacksBestStaticTable, BS_CRITERIA_BOTTOM);
		outFile.close();

//		printf("Signature histogram:\n");
//		for(vector<unsigned long long>::const_iterator it2 = it->second.begin(); it2 != it->second.end(); ++it2) {
//			printf("\t%llu\n", *it2);
//		}
//		printf("\n\n");
	}

	for(tableType::iterator it = compSigTable.begin(); it != compSigTable.end(); ++it) {
		string filename = benchmark+"_nearest_bestStaticEval.txt";

		ofstream outFile;
		outFile.open (filename.c_str());

		calculateBestStaticRTCover(outFile, it->second, slacksBestStaticTable, BS_CRITERIA_NEAREST);
		outFile.close();

	}

	return 0;
}
