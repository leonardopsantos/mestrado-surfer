#!/usr/bin/python

import sys
import os
import glob
import matplotlib.pyplot as plt

benchmarks = []
fits_standard = {}
fits_static_bottom = {}

def calc_fits(work_dir=".", dwc_dir=".", static_dir="."):

    zeroAccRT = {}
    
    bestStaticAccRT = {}
    
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
                    benchmarks.append(currentline[0])
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

    dwc_accHits = {}

    with open(dwc_dir + '/outputs/realTime/accHitsFile.txt', 'r') as accHits_file:
        i = 0
        y = 0
        while True:
            line = accHits_file.readline().rstrip()
            if not line: break
            if( (i%15) == 0 ):
                dwc_accHits[benchmarks[y]] = line
                y = y +1
            i = i+1

    for bench in benchmarks:
        for s, slack in enumerate(slacks):
            pr = float(zeroAccRT[bench][s])/float(dwc_accHits[bench])
            fits_standard[bench].append(float((1-pr)*0.0000871*float(dwc_sensitive_bits[bench])))


# 
# Best Static
#

    accHits = {}

    static_files = glob.glob(static_dir+'/evaluatorBestStatic/*_bottom*.txt')

#   static_files = os.listdir(static_dir+'/evaluatorBestStatic/*_bottom*.txt')

    for bench in benchmarks:
        staticFile = [s for s in static_files if bench in s]
        with open(staticFile[0], 'r') as staticTable:
            pr=[]
            line = staticTable.readline().rstrip() # min_idx = 1529, max_idx = 2059
            line = staticTable.readline().rstrip() # cover 666700
            l = line.split(' ')
            if l[0] != 'cover':
                print "BAD string: ", l
            accHits[bench] = int(l[1]) 
            while True:
                line = staticTable.readline().rstrip()
                if not line: break
                l = line.split(' ')
                if len(l) != 6 or l[0] != "slack":
                    print "BAD string: ", l
                pr.append( (float(l[1])/1000, float(l[5])) )
            bestStaticAccRT[bench] = pr

    for bench in benchmarks:
        fits = []
        fits.append( (0, 0.0000871*float(dwc_sensitive_bits[bench])) )
        fits_static_bottom[bench] = fits

    for bench in benchmarks:
        repair_probs = bestStaticAccRT[bench]
        for slack, pr in repair_probs:
            fits_static_bottom[bench].append( (slack, float((1-pr)*0.0000871*float(dwc_sensitive_bits[bench])) ) )

def print_fits():

    print "Standard scrubbing"
    for bench in benchmarks:
        fits = fits_standard[bench]
        print bench, " ",
        for f in fits:
            print "%.7f" % round(f,7),
        print ""

    print "Best static"
    for bench in benchmarks:
        fits = fits_static_bottom[bench]
        print bench, " ",
        for f in fits:
            print "%.7f" % round(f,7),
        print ""


def plot_fits():
    
    slacks = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600]

    tmp_fits_standard = fits_standard
    tmp_fits_static_bottom = fits_static_bottom

    fig = plt.figure(1, figsize=(11, 10.5))

    # Removes trailing 0.0s in the FIT values and plot the results

    fit_subplots = {}

    handles = None
    labels = None

    for j, bench in enumerate(benchmarks):
        while 0.0 in tmp_fits_standard[bench]:
            try:
                tmp_fits_standard[bench].remove(0.0)
            except:
                break
 
        # this is a simples list for historical reasons
        # the slacks are on the 'slacks' list
         
        # discover the larget slack with a non-zero FIT
        max = slacks[len(tmp_fits_standard[bench])-1]
 
        max_static = fits_static_bottom[bench][-1][0]
 
        fit_min = float(fits_static_bottom[bench][0][1])/200
 
        for i, tp in enumerate(fits_static_bottom[bench]):
            if tp[1] == 0.0 or tp[1] < fit_min:
                max_static = tp[0]
                del tmp_fits_static_bottom[bench][i:]
 
        if max >= max_static:
            tmp_fits_standard[bench].append(float(0.0))
            tmp_fits_static_bottom[bench].append((max, float(0.0)))
        else:
            tmp_fits_static_bottom[bench].append((max_static, float(0.0)))
            for i in slacks[len(tmp_fits_standard):]:
                # add last value as 0.0 as to finish the curves at y=0
                tmp_fits_standard[bench].append(float(0.0))
                if i >= max_static:
                    break;
 
        max = len(tmp_fits_standard[bench])
        max = slacks[:max]

        sp = fig.add_subplot(4, 3, j+1)
        fit_subplots[bench] = sp
        sp.plot(max, tmp_fits_standard[bench], '--',color='0', linewidth=2.0, label="Standard scrubbing")
        sp.plot(*zip(*tmp_fits_static_bottom[bench]), color='0.66', linewidth=2.0, label="Bottom")

        sp.annotate(bench.replace('_', '\_'), xy=(0.75, 0.75), xycoords='axes fraction', horizontalalignment='center')
        sp.yaxis.grid(True)
        handles, labels = sp.get_legend_handles_labels()
        plt.ylabel(r'FIT ($10^9$ device-hours)')
        plt.xlabel(r'Maximum repair time ($\mu$s)')

    plt.tight_layout()

    legend = plt.figlegend(handles, labels, loc=(0.12, 0.01), ncol=4, borderaxespad=0.)

    frame = legend.get_frame()
    frame.set_facecolor('0.90')
    for label in legend.get_texts():
        label.set_fontsize('large')
     
    for label in legend.get_lines():
        label.set_linewidth(1.5)  # the legend line width

    fig.subplots_adjust(bottom=0.11)

##    fig.savefig('fits.pdf', format='pdf', bbox_extra_artists=(legend,), bbox_inches='tight')

    plt.show()

def usage():
    print "analise.py <signatures dir> <dwc signatures dir>"
    sys.exit(-1)

def main(argv):

    work_dir = sys.argv[1]

    if len(sys.argv) == 2:
        dwc_dir = work_dir
        static_dir = work_dir
    elif len(sys.argv) == 3:
        dwc_dir = sys.argv[2]
        static_dir = sys.argv[3]
    else:
        print "Too few arguments!" 
        sys.exit(-1)

    if os.path.exists(work_dir) == False:
        print "Bad directory: ", work_dir 
        sys.exit(-1)

    if os.path.exists(dwc_dir) == False:
        print "Bad directory: ", dwc_dir 
        sys.exit(-1)

    if os.path.exists(static_dir) == False:
        print "Bad directory: ", static_dir 
        sys.exit(-1)

    from matplotlib import rc
    rc('font',**{'family':'sans-serif','sans-serif':['Computer Modern Sans serif']})
    ## for Palatino and other serif fonts use:
    #rc('font',**{'family':'serif','serif':['Palatino']})
    rc('text', usetex=True)

    calc_fits(work_dir, dwc_dir, static_dir)

##    print_fits()

    plot_fits()

if __name__ == "__main__":

    if len(sys.argv) < 2 or len(sys.argv) > 4:
        usage()

    sys.exit(main(sys.argv))
    
    
