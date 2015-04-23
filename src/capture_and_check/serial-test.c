/*
 * serial-test.c
 *
 *  Created on: Oct 2, 2012
 *      Author: leonardopsantos@gmail.com
 */

#define _XOPEN_SOURCE 601

#include <features.h>

#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>
#include <termios.h>
#include <string.h>
#include <time.h>
#include <stdint.h>
#include <sys/select.h>

#include "error_sig.h"

int serialfd;
struct termios old_options;
int do_mainloop = 0;

int main_loop(int sfd)
{
struct error_t *errors, *e;
int i;
FILE *urandfp = NULL;


	errors = alloc_errors(20);
	if( errors == NULL ) {
		printf("Error allocating memory\n");
		return -1;
	}

	urandfp = fopen("/dev/urandom", "r");
	if( urandfp == NULL ) {
		printf("Error opening /dev/urand\n");
		free_errors(errors);
		return -1;
	}

	e = errors;

	while( 1 ) {
		fread(&i, sizeof(i), 1, urandfp);
		i = i%5;

		fread(e->err.inj_faddr, sizeof(e->err.inj_faddr), 1, urandfp);
		fread(e->err.errorVecPO, sizeof(e->err.errorVecPO), 1, urandfp);
		fread(e->err.errorVec, sizeof(e->err.errorVec), 1, urandfp);

		switch(i) {
		case 0:
			e->err.result = 'N';
			break;
		case 1:
			e->err.result = 'O';
			break;
		case 2:
			e->err.result = 'U';
			break;
		case 3:
			e->err.result = 'X';
			break;
		default:
			e->err.result = 'M';
			break;
		}

		if( e->next == NULL ) {
			//e->next = errors;
			break;
		}

		e = e->next;
	}

	e = errors;

	while( !do_mainloop ) {
		printf("waiting...\n");
		sleep(1);
	}
	printf("let's do it!!\n");
	sleep(1);

	while (1) {
		print_error(&(e->err));
		write(sfd, &(e->err), sizeof(e->err));
		sleep(1);
		if( e->next == NULL ) {
			break;
		}
		e = e->next;
	}

	fclose(urandfp);

	free_errors(errors);

	return 0;
}

void do_exit(int signal)
{
	tcsetattr(serialfd, TCSANOW, &old_options);
	close(serialfd);

	exit(0);
}

void do_loop(int signal)
{
	do_mainloop = 1;
}

int main ( void )
{
struct termios new_options;
char *p;

	signal(SIGHUP,do_exit);
	signal(SIGINT,do_exit);
	signal(SIGPIPE,do_exit);
	signal(SIGALRM,do_exit);
	signal(SIGTERM,do_exit);
	signal(SIGUSR2,do_exit);

	do_mainloop = 0;
	signal(SIGUSR1,do_loop);

	serialfd = open("/dev/ptmx", O_RDWR | O_NOCTTY | O_NDELAY);
	if( serialfd < 0 ) {
		printf("Could not open %s, aborting.\n", SERIAL);
		return -1;
	}

	grantpt(serialfd);
	unlockpt(serialfd);

	p = ptsname(serialfd);
	if( p != NULL )
		printf("Slave terminal: %s\n", p);

	tcgetattr(serialfd, &old_options);
	memcpy((void*) &new_options,(void*) &old_options, sizeof(struct termios));

	new_options.c_iflag = 0;
	new_options.c_iflag |= IGNBRK | IGNCR;

	new_options.c_oflag &= ~(OPOST);
	//new_options.c_olag |= ;

	new_options.c_cflag &= ~(CSIZE | CSTOPB | PARENB | CLOCAL);
	new_options.c_cflag |= CS8;

	new_options.c_lflag = 0;
	//new_options.c_lflag |= ;

	cfsetispeed(&new_options, B115200);
	cfsetospeed(&new_options, B115200);
/*
	230400
	460800
	500000
	576000
	921600
	1000000
	1152000
	1500000
	2000000
	2500000
	3000000
	3500000
	4000000
*/

	tcsetattr(serialfd, TCSANOW, &new_options);

	main_loop(serialfd);

	tcsetattr(serialfd, TCSANOW, &old_options);
	close(serialfd);

	return 0;
}
