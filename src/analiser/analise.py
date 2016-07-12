#!/usr/bin/python

import sys
import os
import matplotlib.pyplot as plt

benchmarks = []
evalRT_coverage_0_75 = {}
evalRT_coverage_0_50 = {}
evalRT_coverage_0_25 = {}
evalRT_MTTRTable_coverage_0_75 = {}
evalRT_MTTRTable_coverage_0_50 = {}
evalRT_MTTRTable_coverage_0_25 = {}
evalHits = {}
sensitive_bits = {}
fits_0_75 = {}
fits_0_50 = {}
fits_0_25 = {}

def parse_values(work_dir="."):
    with open(work_dir + '/evaluatorRT/tables/fulltable_eval.txt', 'r') as fulltable_eval:
        while True:
            line = fulltable_eval.readline().rstrip()
            if not line: break
##            print line
            if line == "0.75 evalRT_coverage_0":
                i = 0
                while i < 12:
                    line = fulltable_eval.readline().rstrip()
                    currentline = line.split("\t")
                    evalRT_coverage_0_75[currentline[0]] = currentline[1:]
                    benchmarks.append(currentline[0])
                    i = i+1
            elif line == "0.5 evalRT_coverage_0":
                i = 0
                while i < 12:
                    line = fulltable_eval.readline().rstrip()
                    currentline = line.split("\t")
                    evalRT_coverage_0_50[currentline[0]] = currentline[1:]
                    i = i+1
            elif line == "0.25 evalRT_coverage_0":
                i = 0
                while i < 12:
                    line = fulltable_eval.readline().rstrip()
                    currentline = line.split("\t")
                    evalRT_coverage_0_25[currentline[0]] = currentline[1:]
                    i = i+1
            elif line == "0.75 evalRT_MTTRTable_coverage_":
                i = 0
                while i < 12:
                    line = fulltable_eval.readline().rstrip()
                    currentline = line.split("\t")
                    evalRT_MTTRTable_coverage_0_75[currentline[0]] = currentline[1:]
                    i = i+1
            elif line == "0.5 evalRT_MTTRTable_coverage_":
                i = 0
                while i < 12:
                    line = fulltable_eval.readline().rstrip()
                    currentline = line.split("\t")
                    evalRT_MTTRTable_coverage_0_50[currentline[0]] = currentline[1:]
                    i = i+1
            elif line == "0.25 evalRT_MTTRTable_coverage_":
                i = 0
                while i < 12:
                    line = fulltable_eval.readline().rstrip()
                    currentline = line.split("\t")
                    evalRT_MTTRTable_coverage_0_25[currentline[0]] = currentline[1:]
                    i = i+1

    with open(work_dir + '/evaluatorRT/realTime/evalHits.txt', 'r') as evalHits_file:
        i = 0
        y = 0
        while True:
            line = evalHits_file.readline().rstrip()
            if not line: break
            if( (i%15) == 0 ):
                evalHits[benchmarks[y]] = line
                y = y +1
            i = i+1

    with open(work_dir + '/count.log', 'r') as sens_file:
        while True:
            line = sens_file.readline().rstrip()
            if not line: break
            for bench in benchmarks:
                if bench+".sig" in line:
                    sensitive_bits[bench] = line.split(":")[1]
    

def calc_fits():
    
    slacks = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600]

    ##  calculate FIT for zero slack
    for bench in benchmarks:
        fits = []
        fits.append(0.0000871*float(sensitive_bits[bench]))
        fits_0_75[bench] = fits

    for bench in benchmarks:
        fits = []
        fits.append(0.0000871*float(sensitive_bits[bench]))
        fits_0_50[bench] = fits

    for bench in benchmarks:
        fits = []
        fits.append(0.0000871*float(sensitive_bits[bench]))
        fits_0_25[bench] = fits

    for bench in benchmarks:
        for s, slack in enumerate(slacks):
            pr = float(evalRT_coverage_0_75[bench][s])/float(evalHits[bench])
            fits_0_75[bench].append(float((1-pr)*0.0000871*float(sensitive_bits[bench])))

    for bench in benchmarks:
        for s, slack in enumerate(slacks):
            pr = float(evalRT_coverage_0_50[bench][s])/float(evalHits[bench])
            fits_0_50[bench].append(float((1-pr)*0.0000871*float(sensitive_bits[bench])))

    for bench in benchmarks:
        for s, slack in enumerate(slacks):
            pr = float(evalRT_coverage_0_25[bench][s])/float(evalHits[bench])
            fits_0_25[bench].append(float((1-pr)*0.0000871*float(sensitive_bits[bench])))

def print_fits():
    print "0.75_evalRT_coverage_0"
    for bench in benchmarks:
        fits = fits_0_75[bench]
        print bench, " ",
        for f in fits:
            print "%.7f" % round(f,7),
        print ""
 
 
    print "0.50_evalRT_coverage_0"
    for bench in benchmarks:
        fits = fits_0_50[bench]
        print bench, " ",
        for f in fits:
            print "%.7f" % round(f,7),
        print ""
 
    print "0.25_evalRT_coverage_0"
    for bench in benchmarks:
        fits = fits_0_25[bench]
        print bench, " ",
        for f in fits:
            print "%.7f" % round(f,7),
        print ""

def flot_fits():
    
    slacks = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600]
    
    plt.plot(slacks, fits_0_75["alu_cell_64b"], color='0.0')
    plt.plot(slacks, fits_0_50["alu_cell_64b"], color='0.33')
    plt.plot(slacks, fits_0_25["alu_cell_64b"], color='0.66')
    plt.ylabel(r'FIT ($10^9$ device-hours)')

    plt.xlabel(r'Maximum repair time ($\mu$s)');

    plt.show()

def main(argv):
    work_dir = (sys.argv[1])

    if os.path.exists(work_dir) == False:
        print "Bad directory: ", work_dir 
        sys.exit(-1)

    parse_values(work_dir)

    calc_fits()

#     print_fits()

    flot_fits()

if __name__ == "__main__":
    if len(sys.argv) < 2 :
        print "Too few arguments!"
        sys.exit(-1)

    sys.exit(main(sys.argv))
    
    
