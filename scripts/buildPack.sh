for i in benches/*
do
	for vhd in $i/*_ft_dc_di.vhd
	do
		inwidth=$(cat $vhd | grep -m 1 "inputVector : in STD_LOGIC_VECTOR([0-9]* downto 0)" | sed s/'		inputVector : in STD_LOGIC_VECTOR('// | sed s/' downto 0);'//)
		outwidth=$(cat $vhd | grep -m 1 "outputVector : out STD_LOGIC_VECTOR([0-9]* downto 0)" | sed s/'		outputVector : out STD_LOGIC_VECTOR('// | sed s/' downto 0);'//)
		errorswidth=$(cat $vhd | grep -m 1 "errorVec : out STD_LOGIC_VECTOR([0-9]* downto 0)" | sed s/'		errorVec : out STD_LOGIC_VECTOR('// | sed s/' downto 0)'//)
		errorspowidth=$(cat $vhd | grep -m 1 "errorVecPO : out STD_LOGIC_VECTOR([0-9]* downto 0)" | sed s/'		errorVecPO : out STD_LOGIC_VECTOR('// | sed s/' downto 0);'//)
		echo in = $inwidth
		export inwidth=`expr $inwidth + 1`
		export outwidth=`expr $outwidth + 1`
		export errorswidth=`expr $errorswidth + 1`
		export errorspowidth=`expr $errorspowidth + 1`
		echo $vhd
		echo in = $inwidth
		echo out = $outwidth
		echo errors = $errorswidth
		echo errors po = $errorspowidth
	done
	cat base_vhds/injector_pack.vhd | sed s/INWIDTH/$inwidth/ | sed s/OUTWIDTH/$outwidth/ | sed s/ERRORSINTWIDTH/$errorswidth/ | sed s/ERRORSPOWIDTH/$errorspowidth/ > $i/injector_pack.vhd
done