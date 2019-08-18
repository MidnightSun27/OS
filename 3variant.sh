#!/bin/bash
dir1=$1
wi=$2
he=$3
dir=$4
if [ "$1"=="-h" ] || [ "$1"=="--help" ]; 
then 
	echo "Укажите текущую директорию, файлы из которой необходимо преобразовать. Укажите затем необходимые ширину и длину, директорию, в которую следует направить полученные файлы."
	exit 1
fi
cd $dir1
for i in *.jpg
do
	echo $i
	height=$(identify $i | cut -d\  -f3 | cut -dx -f1)
	width=$(identify $i | cut -d\  -f3 | cut -dx -f2)
	k=$height/$width
	if (($height > $wi || $width > $wi));
	then
		nh=$he
		nw=$nh/$k
		convert $i -resize "$hw"x"$nh" $i.1
		mv "$i.1" "$dir"
	else
		mv "$i" "$dir"
	fi
done
