#!/bin/bash

EVALUATOR=/home/lsantos/work/pep/scripts_cygwin_xilinx/signFaultInjector/src/real_time_evaluator/rtEval

if [ ! -x evaluatorRT ]; then
	mkdir evaluatorRT
fi

if [ ! -x evaluatorRT/realTime ]; then
	mkdir evaluatorRT/realTime
fi


if [ ! -x exec_logs/realTime/eval ]; then
	mkdir exec_logs/realTime/eval
fi

OUTDIR=evaluatorRT/realTime

rm -f $OUTDIR/circnamesFile.txt

for i in test/*.sig1
do
	#circname=$(echo $i | sed s/.sig1/""/ | sed s:test/:"":)
	circname=$(basename $i)
	circname=${circname##*-}
	circname=${circname%.*}
	echo $circname

	int_bits=$(cat sizes_table | grep "$circname int" | sed s/"$circname int "//)
	po_bits=$(cat sizes_table | grep "$circname po" | sed s/"$circname po "//)
	echo $circname $int_bits $po_bits
	echo $circname >> $OUTDIR/circnamesFile.txt

	circtab=($circname"_table")

	zerotable=$(ls outputs/realTime/*"$circname"_table_00000.tab)

	echo EVALUATE
	for table in outputs/realTime/*$circtab*.tab
	do
		tablecirc=$(basename $table)
		tablecirc=${tablecirc%.*}
		echo $table $tablecirc
		$EVALUATOR $i $table $zerotable $int_bits $po_bits | tee exec_logs/realTime/eval/$circname.$tablecirc.log
	done
done

mv *.txt $OUTDIR
