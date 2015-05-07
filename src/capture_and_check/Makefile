#
# 'make depend' uses makedepend to automatically generate dependencies 
#		   (dependencies are added to end of Makefile)
# 'make'	build executable file 'mycc'
# 'make clean'  removes all .o and executable files
#

# define the C compiler to use
CC = gcc

# define any compile-time flags
CFLAGS = -Wall -g -O0

# define any directories containing header files other than /usr/include
#
#INCLUDES = -I/home/newhall/include  -I../include

# define library paths in addition to /usr/lib
#   if I wanted to include libraries not in /usr/lib I'd specify
#   their path using -Lpath, something like:
#LFLAGS = -L/home/newhall/lib  -L../lib

# define any libraries to link into executable:
#   if I want to link in libraries (libx.so or libx.a) I use the -llibname 
#   option, something like (this will link in libmylib.so and libm.so:
#LIBS = -lmylib -lm

# define the C source files
SRCS = capture.c serial-test.c misc.c analyse.c check_cr.c verify_sig.c count_sens_bits.c

# define the C object files 
#
# This uses Suffix Replacement within a macro:
#   $(name:string1=string2)
#	 For each word in 'name' replace 'string1' with 'string2'
# Below we are replacing the suffix .c of all words in the macro SRCS
# with the .o suffix
#
OBJS = $(SRCS:.c=.o)

# define the executable file 
MAIN = capture

#
# The following part of the makefile is generic; it can be used to 
# build any executable just by changing the definitions above and by
# deleting dependencies appended to the file from 'make depend'
#

.PHONY: depend clean

all: $(MAIN) serial-test analyse check_cr verify_sig count_sens_bits

$(MAIN): $(OBJS) 
	$(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) misc.o capture.o $(LFLAGS) $(LIBS)

# this is a suffix replacement rule for building .o's from .c's
# it uses automatic variables $<: the name of the prerequisite of
# the rule(a .c file) and $@: the name of the target of the rule (a .o file) 
# (see the gnu make manual section about automatic variables)
.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

clean:
	$(RM) *.o *~ $(MAIN) serial-test analyse check_cr verify_sig count_sens_bits *.exe

depend: $(SRCS)
	makedepend $(INCLUDES) $^

serial-test: $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o serial-test serial-test.o misc.o $(LFLAGS) $(LIBS)

analyse: $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o analyse misc.o analyse.o $(LFLAGS) $(LIBS)

check_cr: $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o check_cr check_cr.o $(LFLAGS) $(LIBS)

verify_sig: verify_sig.o
	$(CC) $(CFLAGS) $(INCLUDES) -o verify_sig verify_sig.o $(LFLAGS) $(LIBS) -lm

count_sens_bits: count_sens_bits.o
	$(CC) $(CFLAGS) $(INCLUDES) -o count_sens_bits count_sens_bits.o $(LFLAGS) $(LIBS) -lm
	
# DO NOT DELETE THIS LINE -- make depend needs it
