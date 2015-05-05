
CPPFLAGS=-O3 -ggdb -I../../src/lemon-1.3.1 -I../../src/lemon-1.3.1/build
LDFLAGS=-ggdb -lemon -L../../src/lemon-1.3.1/build/lemon

OBJS=evaluator.o  misc.o  parse.o

%o: %c
	$(CC) $(CFLAGS) -c $< -o $@

%o: %cpp
	$(CXX) $(CPPFLAGS) -c $< -o $@

all: $(OBJS)
	$(CXX) $(LDFLAGS) -o rtEval $(OBJS)

.PHONY: clean
clean:
	rm -f *.o rtEval
