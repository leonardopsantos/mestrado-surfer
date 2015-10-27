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

	rm -f $OUTDIR/circNamesFile.txt

	for circname in alu4 alu_cell alu_cell_64b apex2 apex4 des ex1010 ex5p misex3 pdc seq spla
	do
		sigfile=$(ls test/*$circname.sig1)
		echo $circname

		int_bits=$(cat sizes_table | grep "$circname int" | sed s/"$circname int "//)
		po_bits=$(cat sizes_table | grep "$circname po" | sed s/"$circname po "//)

		delay1_cg=$(cat delay_table | grep "$circname cg" | sed s/"$circname cg"//)
		delay2_fg=$(cat delay_table | grep "$circname fg" | sed s/"$circname fg"//)
		echo $circname $int_bits $po_bits $delay1_cg $delay2_fg
		echo $circname >> $OUTDIR/circNamesFile.txt

		circtab=($circname"_table")
		zerotable=$(ls outputs/realTime/*"$circname"_table_00000.tab)

		echo EVALUATE
		for table in outputs/realTimeScaled/$occup/*$circtab*.tab
		do
			tablecirc=$(echo $table | sed s/_table/""/ | sed  s/.tab/""/ | sed s:outputs/realTimeScaled/$occup/:"":)
			echo $sigfile $table $tablecirc
			$EVALUATOR $sigfile $table $zerotable $int_bits $po_bits -s $delay1_cg $delay2_fg $occup
		done
	done
	mv *.txt $OUTDIR
done
