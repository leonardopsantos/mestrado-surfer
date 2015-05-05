#!/bin/bash

EVALUATOR=/home/lsantos/work/pep/scripts_cygwin_xilinx/signFaultInjector/src/real_time_evaluator/rtEval

if [ ! -x evaluatorRT ]; then
	mkdir evaluatorRT
fi

for occup in "0.75" "0.5" "0.25"
do

	OUTDIR=evaluatorRT/$occup

	if [ ! -x $OUTDIR ]; then
		mkdir $OUTDIR
	fi

	for i in test/*.sig1
	do
		circname=$(basename $i)
		circname=${circname##*-}
		circname=${circname%.*}
		echo $circname

		int_bits=$(cat sizes_table | grep "$circname int" | sed s/"$circname int "//)
		po_bits=$(cat sizes_table | grep "$circname po" | sed s/"$circname po "//)

		delay1_cg=$(cat delay_table | grep "$circname cg" | sed s/"$circname cg"//)
		delay2_fg=$(cat delay_table | grep "$circname fg" | sed s/"$circname fg"//)
		echo $circname $int_bits $po_bits $delay1_cg $delay2_fg
		echo $circname >> circnamesFile.txt

		circtab=($circname"_table")
		zerotable=$(ls outputs/realTime/*"$circname"_table_00000.tab)

		echo EVALUATE
		for table in outputs/realTimeScaled/$occup/*$circtab*.tab
		do
			tablecirc=$(echo $table | sed s/_table/""/ | sed  s/.tab/""/ | sed s:outputs/realTimeScaled/$occup/:"":)
			echo $i $table $tablecirc
			$EVALUATOR $i $table $zerotable $int_bits $po_bits -s $delay1_cg $delay2_fg $occup
		done
	done
	mv *.txt $OUTDIR
done
