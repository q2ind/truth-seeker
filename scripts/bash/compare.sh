#!/bin/bash
ver1=$1
ver2=$2
echo "CVS compare $ver1 and $ver2"
files=`cvs diff -N -c -r $ver1 -r $ver2 . | grep 'RCS file' | cut -d' ' -f3 `
cvsfiles='/cm/tools/bin/cvs status -v '

if [ $files='cvs diff: Diffing .' ]; then
	echo "All files are up-to-date"
else
	echo "File or Files need to move to tag $ver1:"
	echo ""
	for file in $files;
	do
		echo $file
		y=${file%,v}
		y=${y##*/projects/}
		cvsfiles="${cvsfiles} $y"
	done
	echo ""
	echo $cvsfiles
	$cvsfiles
fi
