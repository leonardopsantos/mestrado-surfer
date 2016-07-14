#!/usr/bin/python

import sys
import os
import matplotlib.pyplot as plt

benchmarks = []
fits_0_75 = {}
fits_0_50 = {}
fits_0_25 = {}
fits_standard = {}

def calc_fits(work_dir=".", dwc_dir="."):
    
    evalRT_coverage_0_75 = {}
    evalRT_coverage_0_50 = {}
    evalRT_coverage_0_25 = {}
    evalRT_MTTRTable_coverage_0_75 = {}
    evalRT_MTTRTable_coverage_0_50 = {}
    evalRT_MTTRTable_coverage_0_25 = {}
    
    zeroAccRT = {}
    
    evalHits = {}
    sensitive_bits = {}

    with open(work_dir + '/evaluatorRT/tables/fulltable_eval.txt', 'r') as fulltable_eval:
        while True:
            line = fulltable_eval.readline().rstrip()
            if not line: break
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

# 
# Standard scrubbing
#

    dwc_sensitive_bits = {}

    with open(dwc_dir + '/count.log', 'r') as sens_file:
        while True:
            line = sens_file.readline().rstrip()
            if not line: break
            for bench in benchmarks:
                if bench+".sig" in line:
                    dwc_sensitive_bits[bench] = line.split(":")[1]

    for bench in benchmarks:
        fits = []
        fits.append(0.0000871*float(dwc_sensitive_bits[bench]))
        fits_standard[bench] = fits

    with open(dwc_dir + '/outputs/realTime_tables/fulltable.txt', 'r') as fulltable:
        while True:
            line = fulltable.readline().rstrip()
            if not line: break
            if line == "zeroAccRT":
                i = 0
                while i < 12:
                    line = fulltable.readline().rstrip()
                    currentline = line.split("\t")
                    b = currentline[0].split('-')
                    for bench in benchmarks:
                        if bench == b[2]:
                            zeroAccRT[bench] = currentline[1:]
                    i = i+1

    accHits = {}

    with open(dwc_dir + '/outputs/realTime/accHitsFile.txt', 'r') as accHits_file:
        i = 0
        y = 0
        while True:
            line = accHits_file.readline().rstrip()
            if not line: break
            if( (i%15) == 0 ):
                accHits[benchmarks[y]] = line
                y = y +1
            i = i+1

    for bench in benchmarks:
        for s, slack in enumerate(slacks):
            pr = float(zeroAccRT[bench][s])/float(accHits[bench])
            fits_standard[bench].append(float((1-pr)*0.0000871*float(dwc_sensitive_bits[bench])))

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

    print "Standard scrubbing"
    for bench in benchmarks:
        fits = fits_standard[bench]
        print bench, " ",
        for f in fits:
            print "%.7f" % round(f,7),
        print ""

def plot_fits():
    
    slacks = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600]

    tmp_fits_0_75 = fits_0_75
    tmp_fits_0_50 = fits_0_50
    tmp_fits_0_25 = fits_0_25
    tmp_fits_standard = fits_standard

    fig = plt.figure(1, figsize=(11, 10.5))

    # Removes trailing 0.0s in the FIT values and plot the results

    handles = None
    labels = None

    for j, bench in enumerate(benchmarks):
        while 0.0 in tmp_fits_0_75[bench]:
            try:
                tmp_fits_0_75[bench].remove(0.0)
            except:
                break
        while 0.0 in tmp_fits_0_50[bench]:
            try:
                tmp_fits_0_50[bench].remove(0.0)
            except:
                break
        while 0.0 in tmp_fits_0_25[bench]:
            try:
                tmp_fits_0_25[bench].remove(0.0)
            except:
                break
        while 0.0 in tmp_fits_standard[bench]:
            try:
                tmp_fits_standard[bench].remove(0.0)
            except:
                break

        # discover the longest one
        max = len(tmp_fits_standard[bench])
        if max < len(tmp_fits_0_25[bench]):
           max = len(tmp_fits_0_25[bench])
        if max < len(tmp_fits_0_50[bench]):
           max = len(tmp_fits_0_50[bench])
        if max < len(tmp_fits_0_75[bench]):
           max = len(tmp_fits_0_75[bench])

        # add last value as 0.0 as to finish the curves at y=0
        max = max + 1

        i = len(tmp_fits_standard[bench])
        while i < max:
            tmp_fits_standard[bench].append(0)
            i = i+1 

        i = len(tmp_fits_0_25[bench])
        while i < max:
            tmp_fits_0_25[bench].append(0)
            i = i+1 

        i = len(tmp_fits_0_50[bench])
        while i < max:
            tmp_fits_0_50[bench].append(0)
            i = i+1 

        i = len(tmp_fits_0_75[bench])
        while i < max:
            tmp_fits_0_75[bench].append(0)
            i = i+1

        sp = fig.add_subplot(4, 3, j+1)
        sp.plot(slacks[:max], tmp_fits_0_75[bench], color='0.0', linewidth=2.0, label="HST 75 %")
        sp.plot(slacks[:max], tmp_fits_0_50[bench], color='0.33', linewidth=2.0, label="HST 50 %")
        sp.plot(slacks[:max], tmp_fits_0_25[bench], color='0.66', linewidth=2.0, label="HST 25 %")
        sp.plot(slacks[:max], tmp_fits_standard[bench], '--',color='0', linewidth=2.0, label="Standard scrubbing")
        sp.annotate(bench, xy=(0.75, 0.75), xycoords='axes fraction', horizontalalignment='center')
        handles, labels = sp.get_legend_handles_labels()
        plt.ylabel(r'FIT ($10^9$ device-hours)')
        plt.xlabel(r'Maximum repair time ($\mu$s)')

    plt.tight_layout()

    legend = plt.figlegend(handles, labels, loc=(0.11, 0.01), ncol=4, borderaxespad=0.)

    frame = legend.get_frame()
    frame.set_facecolor('0.90')
    for label in legend.get_texts():
        label.set_fontsize('large')
     
    for label in legend.get_lines():
        label.set_linewidth(1.5)  # the legend line width

    fig.subplots_adjust(bottom=0.11)

    fig.savefig('fits.pdf', format='pdf', bbox_extra_artists=(legend,), bbox_inches='tight')

#    plt.show()

def main(argv):
    
    if len(sys.argv) < 2 or len(sys.argv) > 3:
        print "Error! Need circuit and DWC dir!!"
        return

    work_dir = sys.argv[1]

    if len(sys.argv) == 2:
        dwc_dir = work_dir
    else:
        dwc_dir = sys.argv[2]

    if os.path.exists(work_dir) == False:
        print "Bad directory: ", work_dir 
        sys.exit(-1)

    if os.path.exists(dwc_dir) == False:
        print "Bad directory: ", dwc_dir 
        sys.exit(-1)

    calc_fits(work_dir, dwc_dir)

#    print_fits()

    plot_fits()

if __name__ == "__main__":
    if len(sys.argv) < 2 :
        print "Too few arguments!"
        sys.exit(-1)

    sys.exit(main(sys.argv))
    
    
