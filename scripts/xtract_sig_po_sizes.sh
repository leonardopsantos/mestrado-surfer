#!/bin/bash

rm -f sizes_table

for i in $(find benches -iname "*pack.vhd"); do
	vhd=$(basename $i)
	bench=$(basename $(dirname $i))

	x=$(cat $i | grep -i -m 1 "CUT_ERROR_BITS_WIDTH")
	regex="^\s*constant\s+CUT_ERROR_BITS_WIDTH\s+:\s+integer\s+:=\s+([0-9]+);"
	[[ $x =~ $regex ]]
	errorswidth="${BASH_REMATCH[1]}"

	x=$(cat $i | grep -i -m 1 "CUT_ERROR_BITS_PO_WIDTH")
	regex="^\s*constant\s+CUT_ERROR_BITS_PO_WIDTH\s+:\s+integer\s+:=\s+([0-9]+);"
	[[ $x =~ $regex ]]
	errorspowidth="${BASH_REMATCH[1]}"

	echo "$bench $errorswidth $errorspowidth"
	echo "$bench int $errorswidth" >> sizes_table
	echo "$bench po $errorspowidth" >> sizes_table
done



