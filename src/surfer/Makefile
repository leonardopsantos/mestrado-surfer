PWD = $(shell pwd)

CPPFLAGS=-O0 -ggdb -I../lemon-1.3.1 -I../lemon-1.3.1/build
LDFLAGS=-ggdb -lemon -L../lemon-1.3.1/build/lemon

OBJS=circuit.o  ftXilinx.o  lutGenerators.o  main.o  XDWCCOut.o  XSynthOut.o  XSynthParser.o XDWSFOut.o

%o: %c
	$(CC) $(CFLAGS) -c $< -o $@

%o: %cpp
	$(CXX) $(CPPFLAGS) -c $< -o $@

all: $(OBJS)
	$(CXX) $(LDFLAGS) -o xilFT $(OBJS)

.PHONY: clean
clean:
	rm -f *.o xilFT
