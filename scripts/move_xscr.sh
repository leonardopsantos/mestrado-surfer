for i in benches/*
do

	#j=$(echo $i | sed s/"benches\/"/""/)
	echo $i
	#mkdir $j
	cp injector.xscr $i
	#cp lalala/multiple_input_or.vhd benches/$j
done