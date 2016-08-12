#!/bin/bash

EVALUATOR=/home/lsantos/work/pep/scripts_cygwin_xilinx/signFaultInjector/src/real_time_evaluator/slackEval

if [ ! -x evaluatorBestStatic ]; then
	mkdir evaluatorBestStatic
fi

for circname in alu4 alu_cell alu_cell_64b apex2 apex4 des ex1010 ex5p misex3 pdc seq spla
do
	sigfile=$(ls test/*$circname.sig1)
##	echo $circname

	zerotable=$(ls outputs/realTime/*"$circname"_table_00000.tab)
	statictable=$(ls outputs/realTime/*"$circname"_slacks_deadlines.txt)

	echo EVALUATE $circname
	$EVALUATOR $sigfile $zerotable $statictable

	mv *bestStaticEval.txt evaluatorBestStatic/
done
