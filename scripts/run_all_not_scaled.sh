RTTABLE=/home/lsantos/work/pep/scripts_cygwin_xilinx/signFaultInjector/signature_analyzer/real_time_tables/rtTable

	for xx in outputs exec_logs; do
		if [ ! -x $xx ]; then
			mkdir $xx
		fi
		if [ ! -x $xx/notScaled ]; then
			mkdir $xx/notScaled
		fi
	done

	for i in train/*.sig0
	do
		circname=$(basename $i)
		circname=${circname#*-}
		circname=${circname#*-}
		circname=${circname%.*}
		echo $circname
		int_bits=$(cat sizes_table | grep "$circname int" | sed s/"$circname int"//)
		po_bits=$(cat sizes_table | grep "$circname po" | sed s/"$circname po"//)

		echo SIG ANALYZER
		$RTTABLE $i $int_bits $po_bits 1 -t -d 7 | tee exec_logs/notScaled/$circname.log
		mv *.tab outputs/notScaled
		mv *.vhd outputs/notScaled
	done
	
	mv *.txt outputs/notScaled
