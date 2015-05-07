RTTABLE=/home/lsantos/work/pep/scripts_cygwin_xilinx/signFaultInjector/src/real_time_tables/rtTable

for occup in "0.75" "0.5" "0.25"
do

	for xx in outputs exec_logs; do
		if [ ! -x $xx ]; then
			mkdir $xx
		fi
		if [ ! -x $xx/realTimeScaledPST ]; then
			mkdir $xx/realTimeScaledPST
		fi
		if [ ! -x $xx/realTimeScaledPST/$occup ]; then
			mkdir $xx/realTimeScaledPST/$occup
		fi
	done

	for i in train/*.sig0
	do
		circname=$(basename $i)
		circname=${circname##*-}
		circname=${circname%.*}
		echo $circname
		int_bits=$(cat sizes_table | grep "$circname int" | sed s/"$circname int"//)
		po_bits=$(cat sizes_table | grep "$circname po" | sed s/"$circname po"//)
		delay1_cg=$(cat delay_table | grep "$circname cg" | sed s/"$circname cg"//)
		delay2_fg=$(cat delay_table | grep "$circname fg" | sed s/"$circname fg"//)

		echo SIG ANALYZER
		$RTTABLE $i $int_bits $po_bits 1 -t -s $delay1_cg $delay2_fg $occup | tee exec_logs/realTimeScaledPST/$occup/$circname.log
		mv *.tab outputs/realTimeScaledPST/$occup
		mv *.vhd outputs/realTimeScaledPST/$occup
	done
	
	mv *.txt outputs/realTimeScaledPST/$occup
done
