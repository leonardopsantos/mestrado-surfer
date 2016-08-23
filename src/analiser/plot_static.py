#!/usr/bin/python

import sys
import os
import glob
import copy
import matplotlib.pyplot as plt
import numpy as np

benchmarks = []

bench_names = {"alu4"  : "alu4",
               "alu_cell" : "alu 32b",
               "alu_cell_64b" : "alu 64b",
               "apex2" : "apex2",
               "apex4" : "apex4",
               "des"   : "des",
               "ex1010": "ex1010",
               "ex5p"  : "ex5p",
               "misex3": "misex3",
               "pdc"   : "pdc",
               "seq"   : "seq",
               "spla"  : "spla"}

fits_standard = {}
fits_static_top = {}
fits_static_bottom = {}
fits_static_nearest = {}
fits_static_verify = {}

def calc_fits(work_dir=".", dwc_dir=".", static_dir="."):

    zeroAccRT = {}
    
    bestStaticAccRT_bottom = {}
    bestStaticAccRT_top = {}
    bestStaticAccRT_nearest = {}
    verifyBestStaticAccRT = {}

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

    accHits = {}

    with open(dwc_dir + '/count.log', 'r') as sens_file:
        while True:
            line = sens_file.readline().rstrip()
            if not line: break
            for bench in benchmarks:
                if bench+".sig" in line:
                    dwc_sensitive_bits[bench] = line.split(":")[1]

    for bench in benchmarks:
        fits = []
        fits.append( (0, 0.0000871*float(dwc_sensitive_bits[bench])) )
        fits_standard[bench] = fits

    for bench in benchmarks:
        static_files = glob.glob(static_dir+'/evaluatorBestStatic/*'+bench+'_standardScrubbing.txt')
        with open(static_files[0], 'r') as staticTable:
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
            zeroAccRT[bench] = pr

        repair_probs = zeroAccRT[bench]
        for slack, pr in repair_probs:
            fits_standard[bench].append( (slack, float((1-pr)*0.0000871*float(dwc_sensitive_bits[bench])) ) )
# 
# Best Static
#
    for bench in benchmarks:
        static_files = glob.glob(static_dir+'/evaluatorBestStatic/*'+bench+'_bestStaticVerify.txt')
        with open(static_files[0], 'r') as staticTable:
            pr=[]
            line = staticTable.readline().rstrip() # min_idx = 1529, max_idx = 2059
            line = staticTable.readline().rstrip() # cover 666700
            l = line.split(' ')
            if l[0] != 'cover':
                print "BAD string: ", l
##            accHits[bench] = int(l[1]) 
            while True:
                line = staticTable.readline().rstrip()
                if not line: break
                l = line.split(' ')
                if len(l) != 6 or l[0] != "slack":
                    print "BAD string: ", l
                pr.append( (float(l[1])/1000, float(l[5])) )
            verifyBestStaticAccRT[bench] = pr

    for bench in benchmarks:
        static_files = glob.glob(static_dir+'/evaluatorBestStatic/*'+bench+'_bottom_bestStaticEval.txt')
        with open(static_files[0], 'r') as staticTable:
            pr=[]
            line = staticTable.readline().rstrip() # min_idx = 1529, max_idx = 2059
            line = staticTable.readline().rstrip() # cover 666700
            while True:
                line = staticTable.readline().rstrip()
                if not line: break
                l = line.split(' ')
                if len(l) != 6 or l[0] != "slack":
                    print "BAD string: ", l
                pr.append( (float(l[1])/1000, float(l[5])) )
            bestStaticAccRT_bottom[bench] = pr

    for bench in benchmarks:
        static_files = glob.glob(static_dir+'/evaluatorBestStatic/*'+bench+'_top_bestStaticEval.txt')
        with open(static_files[0], 'r') as staticTable:
            pr=[]
            line = staticTable.readline().rstrip() # min_idx = 1529, max_idx = 2059
            line = staticTable.readline().rstrip() # cover 666700
            while True:
                line = staticTable.readline().rstrip()
                if not line: break
                l = line.split(' ')
                if len(l) != 6 or l[0] != "slack":
                    print "BAD string: ", l
                pr.append( (float(l[1])/1000, float(l[5])) )
            bestStaticAccRT_top[bench] = pr

    for bench in benchmarks:
        static_files = glob.glob(static_dir+'/evaluatorBestStatic/*'+bench+'_nearest_bestStaticEval.txt')
        with open(static_files[0], 'r') as staticTable:
            pr=[]
            line = staticTable.readline().rstrip() # min_idx = 1529, max_idx = 2059
            line = staticTable.readline().rstrip() # cover 666700
            while True:
                line = staticTable.readline().rstrip()
                if not line: break
                l = line.split(' ')
                if len(l) != 6 or l[0] != "slack":
                    print "BAD string: ", l
                pr.append( (float(l[1])/1000, float(l[5])) )
            bestStaticAccRT_nearest[bench] = pr

    for bench in benchmarks:
        fits = []
        fits.append( (0, 0.0000871*float(dwc_sensitive_bits[bench])) )
        fits_static_top[bench] = fits

        fits = []
        fits.append( (0, 0.0000871*float(dwc_sensitive_bits[bench])) )
        fits_static_bottom[bench] = fits

        fits = []
        fits.append( (0, 0.0000871*float(dwc_sensitive_bits[bench])) )
        fits_static_nearest[bench] = fits

        fits = []
        fits.append( (0, 0.0000871*float(dwc_sensitive_bits[bench])) )
        fits_static_verify[bench] = fits

    for bench in benchmarks:
        repair_probs = bestStaticAccRT_top[bench]
        for slack, pr in repair_probs:
            fits_static_top[bench].append( (slack, float((1-pr)*0.0000871*float(dwc_sensitive_bits[bench])) ) )

        repair_probs = bestStaticAccRT_bottom[bench]
        for slack, pr in repair_probs:
            fits_static_bottom[bench].append( (slack, float((1-pr)*0.0000871*float(dwc_sensitive_bits[bench])) ) )

        repair_probs = bestStaticAccRT_nearest[bench]
        for slack, pr in repair_probs:
            fits_static_nearest[bench].append( (slack, float((1-pr)*0.0000871*float(dwc_sensitive_bits[bench])) ) )

        repair_probs = verifyBestStaticAccRT[bench]
        for slack, pr in repair_probs:
            fits_static_verify[bench].append( (slack, float((1-pr)*0.0000871*float(dwc_sensitive_bits[bench])) ) )


def print_fits():

#     print "Standard scrubbing"
#     for bench in benchmarks:
#         fits = fits_standard[bench]
#         print bench, " ",
#         for f in fits:
#             print "%.7f" % round(f,7),
#         print ""
# 
    print "Best static"
    for bench in benchmarks:
        fits = fits_static_bottom[bench]
        print bench, " ",
        for f in fits:
            print "(%d, %.7f)" % (f[0], round(f[1],7)),
        print ""

    print "Best static verification"
    for bench in benchmarks:
        fits = fits_static_verify[bench]
        print bench, " ",
        for f in fits:
            print "(%d, %.7f)" % (f[0], round(f[1],7)),
        print ""


def plot_fits():
    
    tmp_fits_standard = copy.deepcopy(fits_standard)
    tmp_fits_static_top = copy.deepcopy(fits_static_top)
    tmp_fits_static_bottom = copy.deepcopy(fits_static_bottom)
    tmp_fits_static_nearest = copy.deepcopy(fits_static_nearest)
    tmp_fits_static_verify = copy.deepcopy(fits_static_verify)

    fig = plt.figure(1, figsize=(12, 11.5))

    # Removes trailing 0.0s in the FIT values and plot the results

    fit_subplots = {}

    handles = None
    labels = None

    for j, bench in enumerate(benchmarks):

        # this is a simples list for historical reasons
        # the slacks are on the 'slacks' list

#         max_static = tmp_fits_static_verify[bench][0][0]
 
        fit_min = float(tmp_fits_static_verify[bench][0][1])/200

        for i, tp in enumerate(tmp_fits_standard[bench]):
            if tp[1] == 0.0 or tp[1] < fit_min:
#                 if max_static < tp[0]:
#                     max_static = tp[0]
                del tmp_fits_standard[bench][i:]
                tmp_fits_standard[bench].append((tp[0], float(0.0)))

#         for i, tp in enumerate(tmp_fits_static_verify[bench]):
#             if tp[1] == 0.0 or tp[1] < fit_min:
#                 if max_static < tp[0]:
#                     max_static = tp[0]
#                 del tmp_fits_static_verify[bench][i:]
 
        for i, tp in enumerate(tmp_fits_static_bottom[bench]):
            if tp[1] == 0.0 or tp[1] < fit_min:
#                 if max_static < tp[0]:
#                     max_static = tp[0]
                del tmp_fits_static_bottom[bench][i:]
                tmp_fits_static_bottom[bench].append((tp[0], float(0.0)))
  
        for i, tp in enumerate(tmp_fits_static_top[bench]):
            if tp[1] == 0.0 or tp[1] < fit_min:
#                 if max_static < tp[0]:
#                     max_static = tp[0]
                del tmp_fits_static_top[bench][i:]
                tmp_fits_static_top[bench].append((tp[0], float(0.0)))

        for i, tp in enumerate(tmp_fits_static_nearest[bench]):
            if tp[1] == 0.0 or tp[1] < fit_min:
#                 if max_static < tp[0]:
#                     max_static = tp[0]
                del tmp_fits_static_nearest[bench][i:]
                tmp_fits_static_nearest[bench].append((tp[0], float(0.0)))

#         tmp_fits_standard[bench].append((max_static, float(0.0)))
#         tmp_fits_static_top[bench].append((max_static, float(0.0)))
#         tmp_fits_static_bottom[bench].append((max_static, float(0.0)))
#         tmp_fits_static_nearest[bench].append((max_static, float(0.0)))

#        tmp_fits_static_verify[bench].append((max_static, float(0.0)))
 
        sp = fig.add_subplot(4, 3, j+1)
        fit_subplots[bench] = sp

        sp.plot(*zip(*tmp_fits_static_top[bench]), color='r', linewidth=2.0, label="Top")

        sp.plot(*zip(*tmp_fits_static_bottom[bench]), color='g', linewidth=2.0, label="Bottom")

        sp.plot(*zip(*tmp_fits_static_nearest[bench]), color='b', linewidth=2.0, label="Nearest")

        sp.plot(*zip(*tmp_fits_standard[bench]), color='0.50', linewidth=2.0, label="Standard scrubbing")

#        sp.plot(*zip(*tmp_fits_static_verify[bench]), linestyle='--', color='0', linewidth=1.5, label="Shifted scrubbing", marker='o', markersize=3.0)

        sp.annotate(bench_names[bench], xy=(0.75, 0.75), xycoords='axes fraction', horizontalalignment='center', fontsize=14)
        sp.yaxis.grid(True)
        handles, labels = sp.get_legend_handles_labels()
        plt.ylabel(r'FIT ($10^9$ device-hours)')
        plt.xlabel(r'Maximum repair time ($\mu$s)')

    plt.tight_layout()

    legend = plt.figlegend(handles, labels, loc=(0.22, 0.01), ncol=4, borderaxespad=0.)

    frame = legend.get_frame()
    frame.set_facecolor('0.90')
    for label in legend.get_texts():
        label.set_fontsize('large')
     
    for label in legend.get_lines():
        label.set_linewidth(1.5)  # the legend line width

    fig.subplots_adjust(bottom=0.11)

    fig.savefig('TODAES_fits.pdf', format='pdf', bbox_extra_artists=(legend,), bbox_inches='tight')

#    plt.show()

def autolabel(rects, ax):
    # attach some text labels
    for rect in rects:
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width()/2., 1.02*height,
                '%d' % int(height),
                ha='center', va='bottom')

def calc_todaes():

    area_standard = {};
    area_top = {};
    area_bottom = {};
    area_nearest = {};

    rel_top = []
    rel_bot = []
    rel_near = []

    tmp_fits_standard = copy.deepcopy(fits_standard)
    tmp_fits_static_top = copy.deepcopy(fits_static_top)
    tmp_fits_static_bottom = copy.deepcopy(fits_static_bottom)
    tmp_fits_static_nearest = copy.deepcopy(fits_static_nearest)

    sum_top = float(0.0)
    sum_bot = float(0.0)
    sum_near = float(0.0)

    for j, bench in enumerate(benchmarks):
        sum = float(0.0)
        for i, tp in enumerate(fits_standard[bench]):
            if tp[1] == 0.0:
                break
            sum = sum + tp[1]

        area_standard[bench] = sum

        sum = float(0.0)
        for i, tp in enumerate(fits_static_bottom[bench]):
            if tp[1] == 0.0:
                break
            sum = sum + tp[1]
  
        area_bottom[bench] = sum

        sum = float(0.0)
        for i, tp in enumerate(fits_static_top[bench]):
            if tp[1] == 0.0:
                break
            sum = sum + tp[1]
  
        area_top[bench] = sum

        sum = float(0.0)
        for i, tp in enumerate(fits_static_nearest[bench]):
            if tp[1] == 0.0:
                break
            sum = sum + tp[1]

        area_nearest[bench] = sum

        print "%s\t&\t%.2f &\t%.2f \\%% &\t%.2f &\t%.2f \\%% &\t%.2f \t&\t%.2f \\%% \t&\t%.2f \t\t\\\\\hline" % (bench_names[bench],
                                                                                        area_top[bench],
                                                                                        (area_top[bench]/area_standard[bench])*100,
                                                                                        area_bottom[bench],
                                                                                        (area_bottom[bench]/area_standard[bench])*100,
                                                                                        area_nearest[bench],
                                                                                        (area_nearest[bench]/area_standard[bench])*100,
                                                                                        area_standard[bench])

        sum_top = sum_top + float(area_top[bench]/area_standard[bench])
        sum_bot = sum_bot + float(area_bottom[bench]/area_standard[bench])
        sum_near = sum_near + float(area_nearest[bench]/area_standard[bench])

        rel_top.append((area_top[bench]/area_standard[bench])*100)
        rel_bot.append((area_bottom[bench]/area_standard[bench])*100)
        rel_near.append((area_nearest[bench]/area_standard[bench])*100)

    sum_top = 100*sum_top/len(benchmarks)
    sum_bot = 100*sum_bot/len(benchmarks)
    sum_near = 100*sum_near/len(benchmarks)

    print "\\textbf{Average} & & \\textbf{%.2f \\%%} & & \\textbf{%.2f \\%%} & & \\textbf{%.2f \\%%} \\\\\hline" % (sum_top,
                                                                                                 sum_bot,
                                                                                                 sum_near)

    fig = plt.figure(3, figsize=(10.5, 7))

    fit_subplots = {}

    ind = np.arange(len(benchmarks))
    width = 0.28

    ax = fig.add_subplot(1,1, 1)
    
    from matplotlib.ticker import FuncFormatter
    formatter = FuncFormatter(lambda y, pos: "%d \\%%" % (y))
    ax.yaxis.set_major_formatter(formatter)

    rects1 = ax.bar(ind, rel_top, width, color='r')
    
    rects2 = ax.bar(ind + width, rel_bot, width, color='g')

    rects3 = ax.bar(ind + 2*width, rel_near, width, color='b')

    plt.tight_layout()
    
    names = []

    for bench in benchmarks:
        names.append(bench_names[bench])

    ax.set_ylabel('Relative Accumulated FIT')
#    ax.set_title('Scores by group and gender')
    ax.set_xticks(ind + width)
    ax.set_xticklabels(names)
    
    ax.set_ylim([0, 100])
    ax.yaxis.grid(True)
    
#    legend = ax.legend((rects1[0], rects2[0], rects3[0]), ("Top", "Bottom", "Nearest"))
    legend = plt.figlegend((rects1[0], rects2[0], rects3[0]), ("Top", "Bottom", "Nearest"), loc=(0.25, 0.01), ncol=3, borderaxespad=0.)

    frame = legend.get_frame()
    frame.set_facecolor('0.90')
#     for label in legend.get_texts():
#         label.set_fontsize('large')
      
    for label in legend.get_lines():
        label.set_linewidth(1.5)  # the legend line width
 
    fig.subplots_adjust(left=0.08, bottom=0.11, top = 0.95)
        
    autolabel(rects1, ax)
    autolabel(rects2, ax)
    autolabel(rects3, ax)

#    plt.show()

def calc_todaes2():

    area_standard = {};
    area_top = {};
    area_bottom = {};
    area_nearest = {};

    rel_std = []
    rel_top = []
    rel_bot = []
    rel_near = []

    for j, bench in enumerate(benchmarks):
        sum = float(0.0)
        for i, tp in enumerate(fits_standard[bench]):
            if tp[1] == 0.0:
                area_standard[bench] = sum
                rel_std.append(float(area_standard[bench]/float(i-1)))
                break
            sum = sum + tp[1]

        sum = float(0.0)
        for i, tp in enumerate(fits_static_bottom[bench]):
            if tp[1] == 0.0:
                area_bottom[bench] = sum
                rel_bot.append(float(area_bottom[bench]/float(i-1)))
                break
            sum = sum + tp[1]

        sum = float(0.0)
        for i, tp in enumerate(fits_static_top[bench]):
            if tp[1] == 0.0:
                area_top[bench] = sum
                rel_top.append(float(area_top[bench]/float(i-1)))
                break
            sum = sum + tp[1]

        sum = float(0.0)
        for i, tp in enumerate(fits_static_nearest[bench]):
            if tp[1] == 0.0:
                area_nearest[bench] = sum
                rel_near.append(float(area_nearest[bench]/float(i-1)))
                break
            sum = sum + tp[1]

    fig = plt.figure(4, figsize=(11, int(11/1.61803398875)))
 
    fit_subplots = {}
 
    ind = np.arange(len(benchmarks))
    width = 0.20
 
    ax = fig.add_subplot(1,1, 1)
     
    from matplotlib.ticker import FuncFormatter
    formatter = FuncFormatter(lambda y, pos: "%.2f" % (y))
    ax.yaxis.set_major_formatter(formatter)
 
    rects1 = ax.bar(ind, rel_top, width, color='r')
     
    rects2 = ax.bar(ind + width, rel_bot, width, color='g')
 
    rects3 = ax.bar(ind + 2*width, rel_near, width, color='b')
    
    rects4 = ax.bar(ind + 3*width, rel_std, width, color='0.5')
 
    plt.tight_layout()
     
    names = []
 
    for bench in benchmarks:
        names.append(bench_names[bench])
 
    ax.set_ylabel('Average FIT')
    ax.set_xticks(ind + width)
    ax.set_xticklabels(names)
     
#    ax.set_ylim([0, 10.00])
     
    ax.yaxis.grid(True)
     
    legend = plt.figlegend((rects1[0], rects2[0], rects3[0], rects4[0]), ("Top", "Bottom", "Nearest", "Std. scrb."), loc=(0.23, 0.01), ncol=4, borderaxespad=0.)
 
    frame = legend.get_frame()
    frame.set_facecolor('0.90')
#     for label in legend.get_texts():
#         label.set_fontsize('large')
       
    for label in legend.get_lines():
        label.set_linewidth(1.5)  # the legend line width
  
    fig.subplots_adjust(left=0.075, bottom=0.11)
         
    for rect in rects1:
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width()/1.4, 1.03*height,
                '%.2f' % float(height),
                ha='center', va='bottom', rotation=45)

    for rect in rects2:
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width()/1.4, 1.03*height,
                ' %.2f ' % float(height),
                ha='center', va='bottom', rotation=45)


    for rect in rects3:
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width()/1.4, 1.03*height,
                '%.2f' % float(height),
                ha='center', va='bottom', rotation=45)

    for rect in rects4:
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width()/1.4, 1.03*height,
                '%.2f' % float(height),
                ha='center', va='bottom', rotation=45)

#    plt.show()

    fig.savefig('TODAES_avgs.pdf', format='pdf', bbox_extra_artists=(legend,), bbox_inches='tight')

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

#    print_fits()

    plot_fits()

    calc_todaes()
    
    calc_todaes2()

if __name__ == "__main__":

    if len(sys.argv) < 2 or len(sys.argv) > 4:
        usage()

    sys.exit(main(sys.argv))
    
    
