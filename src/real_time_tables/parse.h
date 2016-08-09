#ifndef _PARSE_H_INCLUDED_
#define _PARSE_H_INCLUDED_

#include "common.h"
#include "misc.h"
#include <sys/types.h>
#include <time.h>
#include <stdio.h>
#include <map>
#include <vector>
#include <list>
#include <math.h>
#include <boost/foreach.hpp>

#define START_WINDOW_SIZE 3 //consecutive frames that must be above the threshold to determine the partition beginning
#define ACTIVE_THRESHOLD 2

#define CONFIG_SIZE 2060
#define TOTAL_HITS CONFIG_SIZE
#define SIG_PER_BIT 20
#define SIG_SIZE (sig_size_internal+sig_size_po)
#define SIG_SIZE_INT_BYTES ( (int)ceil(( (double)sig_size_internal )/8.0) )
#define SIG_SIZE_PO_BYTES ( (int)ceil(( (double)sig_size_po )/8.0) )
#define ENTRY_SIZE (sizeof(sig_header_t) + SIG_SIZE_PO_BYTES + SIG_SIZE_INT_BYTES)

using namespace boost;
#define foreach BOOST_FOREACH

using namespace std;

typedef map<vector<bool>, vector<unsigned int> > tableType; //a table that stores the faddr histogram for each signature
typedef map<unsigned int, list<vector<bool> > > faddr2signsType; //a table that stores which signatures point to a given faddr


/** Header to the whole capture file */
struct file_header_t {
	time_t time_start;			/**< start time */
	time_t time_end;			/**< end time */
	unsigned long int total_errors;	/**< total errors received */
};

/** Header for each error */
struct sig_header_t {
	int8_t result;				/**< result:SEND_RESULT */
	int8_t inj_faddr[3];			/**< inj_faddr:SEND_FADDR */
};

struct error_t {
	sig_header_t header;
	int8_t *sig_po;
	int8_t *sig_int;
};


enum lineOpts {OPT_SCALE_DEADLINE, OPT_PARTIAL_TABLES, OPT_TRIM_AREA, OPT_FILL_BITS, OPT_XOR_COMPRESS, OPT_DUMB, OPT_ONLY_MAJOR, OPT_BEST_STATIC_SLACKS};

#define OPT_CNT (OPT_ONLY_MAJOR + 1)

extern unsigned int max_idx;
extern unsigned int min_idx;
extern unsigned int first_maj;
extern unsigned int sig_size_internal;
extern unsigned int sig_size_po;
extern unsigned int cut_threshold;
extern unsigned int signatureCnt;
extern bool options[OPT_CNT];

int check_error(struct error_t *err);
void parseInfile(char *filename, tableType &signatureTable);

#endif
