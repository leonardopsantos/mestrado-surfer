/*
 * error_sig.h
 *
 *  Created on: Oct 2, 2012
 *      Author: leonardopsantos@gmail.com
 */

#ifndef ERROR_SIG_H_
#define ERROR_SIG_H_

//#define PSEUDOTTY

#define SERIAL	"/dev/ttyUSB0"

/** Header to the whole capture file */
struct file_header_t {
	time_t time_start;			/**< start time */
	time_t time_end;			/**< end time */
	unsigned long int total_errors;	/**< total errors received */
};

#define ERRORPOBITS 2
#define ERRORBITS ERRORPOBITS

/** Header for each error */
struct error_sig_t {
	int8_t result;					/**< result:SEND_RESULT */
	int8_t inj_faddr[3];			/**< inj_faddr:SEND_FADDR */
	int8_t errorVecPO[ERRORPOBITS];	/**< errorVecPO:SEND_SIGNATURE_PO */
	int8_t errorVec[ERRORBITS];		/**< errorVec:SEND_SIGNATURE */
};

struct error_t {
	struct error_sig_t err;
	struct error_t *next;
};

inline struct error_t *alloc_errors(int num);
int free_errors(struct error_t *err);
int print_error(struct error_sig_t *err);
int check_error(struct error_sig_t *err);

#endif /* ERROR_SIG_H_ */
