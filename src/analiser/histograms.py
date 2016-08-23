#!/usr/bin/python

import sys
import os
import glob

import numpy as np

import matplotlib.pyplot as plt

histograms = {}
inital_final_frames = {}

benchmarks = ["alu4", "alu_cell", "alu_cell_64b", "apex2", "apex4", "des", "ex1010", "ex5p", "misex3", "pdc","seq","spla"]
#benchmarks = ["alu4","alu_cell", "alu_cell_64b", "apex2"]

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

def usage():
    print "histograms.py <histogram file>"
    sys.exit(-1)

def plot_histogram(bench, filename):

    print "Plot error histogram for "+ bench_names[bench]

    histFile = os.path.splitext(filename)[0]
#     circName = os.path.splitext(filename)[0].split('/')[0]
#     deadline = os.path.splitext(filename)[0].split('/')[2]
#     deadline = deadline.split('_')[2]

    plt.figure(figsize=(9, int(9/1.61803398875)))

##    plt.bar(*zip(*histograms[bench]))
    plt.bar(*zip(*histograms[bench]), color='0.10', width = 1.05, linewidth=0.0)

    plt.ylabel(r'Error Count', fontsize=14)
    plt.xlabel(r'Frame Address', fontsize=14)
    ax = plt.subplot()
    ax.yaxis.grid(True)
    plt.ticklabel_format(useOffset=False)

#     ax.set_xlim(inital_final_frames[bench])
    start, stop = inital_final_frames[bench]
    res = (stop-start)/6
    ticks = np.arange(start, stop, res)
    ax.set_xticks(ticks)

#    plt.title("Error histogram for "+ bench_names[bench])

    plt.tight_layout()

#    plt.show()

    plt.savefig(histFile+'.pdf')

def build_histgrams(hist_dir):

    for j, bench in enumerate(benchmarks):
        static_files = glob.glob(hist_dir+'/evaluatorBestStatic/*'+bench+'_bestStaticHisto.txt')
        hist = []
        histograms[bench] = hist
        print "Build error histogram for "+ bench_names[bench]
        with open(static_files[0], 'r') as hist_file:
            initial = 0
            final = 0
            line = hist_file.readline().rstrip() ## sum
            line = hist_file.readline().rstrip() ## min 104193
            l = line.split(' ')
            if l[0] != 'min':
                print "Error!!"
            initial = int(l[1])
    
            line = hist_file.readline().rstrip() ## max 105635
            l = line.split(' ')
            if l[0] != 'max':
                print "Error!!"
            final = int(l[1])
    
            inital_final_frames[bench] = (initial, final)
    
            while True:
                line = hist_file.readline().rstrip()
                if not line: break
                l = line.split(' ')
                histograms[bench].append((int(l[0]), int(l[1])))

#        plot_histogram(bench, static_files[0])

def plot_histograms(dir_name):

    fig = plt.figure(1, figsize=(12, 13))

    # Removes trailing 0.0s in the FIT values and plot the results

    fit_subplots = {}

    handles = None
    labels = None

    for j, bench in enumerate(benchmarks):
 
        print bench_names[bench]
 
        ax = fig.add_subplot(4, 3, j+1)
        fit_subplots[bench] = ax

        plt.bar(*zip(*histograms[bench]), color='0.15', width = 1.02, linewidth=0.0)
    
#         plt.ylabel(r'Error Count', fontsize=14)
#         plt.xlabel(r'Frame Address', fontsize=14)
        plt.ylabel(r'Error Count')
        plt.xlabel(r'Frame Address')

        plt.ticklabel_format(useOffset=False)

        ax.yaxis.grid(True)
    
#        ax.set_autoscalex_on(False)
#        ax.set_xlim(inital_final_frames[bench])

        start, stop = inital_final_frames[bench]
        res = (stop-start)/6
        ticks = np.arange(start, stop, res)
        ax.set_xticks(ticks)
        ax.tick_params(
        axis='x',          # changes apply to the x-axis
        which='both',      # both major and minor ticks are affected
        bottom='off',      # ticks along the bottom edge are off
        top='off')

        ax.annotate(bench_names[bench], xy=(0.85, 0.90), xycoords='axes fraction', horizontalalignment='center', fontsize=14)

    plt.tight_layout()

#    plt.show()

    fig.savefig('TODAES_all_histos.pdf', format='pdf')

def main(argv):

    from matplotlib import rc
    rc('font',**{'family':'sans-serif','sans-serif':['Computer Modern Sans serif']})
    ## for Palatino and other serif fonts use:
    #rc('font',**{'family':'serif','serif':['Palatino']})
    rc('text', usetex=True)


    hist_dir = sys.argv[1]

    if os.path.exists(hist_dir) == False:
        print "Directory now found: ", hist_dir 
        sys.exit(-1)


    from matplotlib import rc
    rc('font',**{'family':'sans-serif','sans-serif':['Computer Modern Sans serif']})
    ## for Palatino and other serif fonts use:
    #rc('font',**{'family':'serif','serif':['Palatino']})
    rc('text', usetex=True)

    build_histgrams(hist_dir)

    plot_histograms(hist_dir)

if __name__ == "__main__":

    if len(sys.argv) < 2:
        usage()

    sys.exit(main(sys.argv))
    
    
