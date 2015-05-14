for i in benches/*
do
	rm -f $i/project.prj
	nome=$(echo $i | sed 's/benches\///')
	for vhds in $i/*.vhd
	do
		nomevhd=$(echo $vhds | sed 's/benches\///')
		nomevhd=$(echo $nomevhd | sed "s/$nome\///")
		echo vhdl work \"$nomevhd\" >> $i/project.prj
	done
	echo vhdl work \"ipcore_dir\/frame_mem.vhd\" >> $i/project.prj
	cat $i/project.prj | sed  's/_ft_df_di/_ft_dc_di/' > proj.prj
	mv proj.prj $i/project.prj
	echo $nome
done
