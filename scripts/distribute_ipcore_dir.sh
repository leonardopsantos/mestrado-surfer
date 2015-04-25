for i in benches/*
do
	cat $i/project.prj | sed s/"frame_mem.vhd"/"ipcore_dir\/frame_mem.vhd"/ > proj2
	rm $i/project.prj
	mv proj2 $i/project.prj
done