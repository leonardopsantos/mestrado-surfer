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

int serialfd;
struct termios old_options;

int main_loop(int sfd )
{
//struct file_header_t outf_header;
fd_set readfds, tmpfds;
struct timeval tmo;
int selret, i, k;
unsigned char ttybuf[128];

	FD_ZERO(&readfds);
	FD_SET(sfd, &readfds);

	memset(ttybuf, '\0', sizeof(ttybuf));

	while (1) {
		tmo.tv_sec = 60;         /* seconds */
		tmo.tv_usec = 0;        /* microseconds */
		tmpfds = readfds;
		memset(ttybuf, '\0', sizeof(ttybuf));
		selret = select(sfd+1, &tmpfds, NULL, NULL, &tmo);
		if( selret <= 0 ) {
			break;
		}
		
		tmo.tv_sec = 0;         /* seconds */
		tmo.tv_usec = 50000;        /* microseconds */
		selret = select(sfd+1, NULL, NULL, NULL, &tmo);

		i = read(sfd, ttybuf, sizeof(ttybuf));

		if( i < 0 ) {
			if( errno == EINTR || errno == EAGAIN ) {
				continue;
			} else {
				perror("WTF!");
				goto ex_it;
			}
		} else if( i == 0 ) {
			break;
		}
		for( k = 0; k < i; k++ ) {
			printf( " %02x", ttybuf[k] );
		}
		printf( "\n");
	}

ex_it:

	return 0;
}

void do_exit(int signal)
{
	tcsetattr(serialfd, TCSANOW, &old_options);
	close(serialfd);

	exit(0);
}

int main ( void )
{
struct termios new_options;

	signal(SIGHUP,do_exit);
	signal(SIGINT,do_exit);
	signal(SIGPIPE,do_exit);
	signal(SIGALRM,do_exit);
	signal(SIGTERM,do_exit);
	signal(SIGUSR1,do_exit);
	signal(SIGUSR2,do_exit);

	serialfd = open(SERIAL, O_RDWR | O_NOCTTY | O_NDELAY);

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
		main_loop(serialfd);
	}

	tcsetattr(serialfd, TCSANOW, &old_options);
	close(serialfd);

	return 0;
}
