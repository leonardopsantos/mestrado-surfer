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
#include <errno.h>
#include <stdint.h>
#include <sys/select.h>

#include "error_sig.h"

#ifndef SERIAL
#define SERIAL	"/dev/ttyUSB0"
#endif

int serialfd;
struct termios old_options;

#ifdef PSEUDOTTY
void send_sig( void )
{
	char line[1024];
	FILE *cmd = popen("pidof serial-test", "r");

	fgets(line, 1024, cmd);
	pid_t pid = strtoul(line, NULL, 10);

	kill(pid, SIGUSR1);

	pclose(cmd);
}
#endif /* PSEUDOTTY */

int main_loop(int sfd, FILE *outfp)
{
//struct file_header_t outf_header;
fd_set readfds, tmpfds;
struct timeval tmo;
int selret, i, first_sig, count;
unsigned char ttybuf[512];

	FD_ZERO(&readfds);
	FD_SET(sfd, &readfds);

//	memset(&outf_header, '\0', sizeof(outf_header));
	memset(ttybuf, '\0', sizeof(ttybuf));

	#ifdef PSEUDOTTY
	printf("signalling serial-test\n");
	send_sig();
	#endif /* PSEUDOTTY */

//	time(&(outf_header.time_start));

//	fwrite(&outf_header, sizeof(outf_header), 1, outfp);

	first_sig = 1;
	count = 0;

	printf("Start! %d %d\n", first_sig, count);

	while (1) {
		#ifdef PSEUDOTTY
		tmo.tv_sec = 5;         /* seconds */
		#else
		tmo.tv_sec = (first_sig == 1 ? 10800 : 1200);         /* seconds */
		#endif /* PSEUDOTTY */
		tmo.tv_usec = 0;        /* microseconds */
		tmpfds = readfds;
		memset(ttybuf, '\0', sizeof(ttybuf));
		selret = select(sfd+1, &tmpfds, NULL, NULL, &tmo);
		if( selret <= 0 ) {
			break;
		}
		i = read(sfd, ttybuf, sizeof(ttybuf));

//		printf("%d(%c) ",i, e->err.result);
//		printf("%d \n",i);
	
		if( i < 0 ) {
			if( errno == EINTR || errno == EAGAIN ) {
				continue;
			} else {
				perror("WTF!");
				printf("WTF!\n");
				goto ex_it;
			}
		} else if( i == 0 ) {
			break;
		}

		fwrite(ttybuf, i, 1, outfp);

		first_sig = 0;
		count++;
	}

	printf("End! Captured %d signatures.\n", count);

	/*
	fwrite(&outf_header, sizeof(outf_header), 1, outfp);
	e = errors;
	for(i = 0; i < outf_header.total_errors && e != NULL; i++) {
		fwrite(&(e->err), sizeof(struct error_sig_t), 1, outfp);
		e = e->next;
	}
	*/

ex_it:

	return 0;
}

void do_exit(int signal)
{
	tcsetattr(serialfd, TCSANOW, &old_options);
	close(serialfd);

	exit(0);
}

int main ( int argc, char *argv[] )
{
struct termios new_options;
FILE *outfp;

	if( argc == 1 ) {
	  outfp = fopen("error.bin", "wb");
	} else {
	  outfp = fopen(argv[1], "wb");
	}
	if( outfp == NULL ) {
		printf("Error opening %s for writing!\n", "error.bin");
		return -1;
	}

	signal(SIGHUP,do_exit);
	signal(SIGINT,do_exit);
	signal(SIGPIPE,do_exit);
	signal(SIGALRM,do_exit);
	signal(SIGTERM,do_exit);
	signal(SIGUSR1,do_exit);
	signal(SIGUSR2,do_exit);

	#ifdef PSEUDOTTY
	serialfd = open("/dev/pts/15", O_RDWR);
	#else
	serialfd = open(SERIAL, O_RDWR | O_NOCTTY /*| O_NDELAY*/);
	#endif /* PSEUDOTTY */

	if( serialfd < 0 ) {
		printf("Could not open %s, aborting.\n", SERIAL);
		return -1;
	}
	tcgetattr(serialfd, &old_options);
	memcpy((void*) &new_options,(void*) &old_options, sizeof(struct termios));

	new_options.c_iflag = 0;
	new_options.c_iflag |= IGNPAR | IGNBRK;

	new_options.c_oflag = 0;
//	new_options.c_oflag &= ~(OPOST);
	//new_options.c_olag |= ;

	new_options.c_cflag &= ~(CSIZE | CSTOPB | PARENB | CRTSCTS );
	new_options.c_cflag |= CS8 | CLOCAL | CREAD;

	new_options.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
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

	if (fcntl( serialfd, F_SETFL, fcntl(serialfd, F_GETFL) & ~O_NONBLOCK ) == -1) {
	/* device can't be set to blocking */
		perror("device can't be set to blocking!");
	} else {
		main_loop(serialfd, outfp);
	}

	tcsetattr(serialfd, TCSANOW, &old_options);
	close(serialfd);
	fclose(outfp);

	return 0;
}
