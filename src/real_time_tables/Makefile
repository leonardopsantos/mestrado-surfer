CPPFLAGS=-O3 -ggdb -I../../src/lemon-1.3.1 -I../../src/lemon-1.3.1/build
LDFLAGS=-ggdb -lemon -L../../src/lemon-1.3.1/build/lemon

OBJS=buildTable.o dumb.o main.o misc.o parse.o print.o statistics.o

%o: %c
	$(CC) $(CFLAGS) -c $< -o $@

%o: %cpp
	$(CXX) $(CPPFLAGS) -c $< -o $@

all: $(OBJS)
	$(CXX) $(LDFLAGS) -o rtTable $(OBJS)

.PHONY: clean
clean:
	rm -f *.o rtTable
