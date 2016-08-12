
CPPFLAGS=-O3 -ggdb -I../../src/lemon-1.3.1 -I../../src/lemon-1.3.1/build
LDFLAGS=-ggdb -lemon -L../../src/lemon-1.3.1/build/lemon

OBJS=evaluator.o  misc.o  parse.o slack_eval.o

%o: %c
	$(CC) $(CFLAGS) -c $< -o $@

%o: %cpp
	$(CXX) $(CPPFLAGS) -c $< -o $@

all: $(OBJS) evaluator slack_eval

evaluator: $(OBJS)
	$(CXX) $(LDFLAGS) -o rtEval evaluator.o misc.o parse.o 

slack_eval: $(OBJS)
	$(CXX) $(LDFLAGS) -o slackEval misc.o parse.o slack_eval.o

.PHONY: clean
clean:
	rm -f *.o rtEval slackEval
