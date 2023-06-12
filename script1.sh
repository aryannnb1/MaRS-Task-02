#!/bin/bash

directory=${pwd}
echo $directory
mkdir Modified_dir

file=${grep/.txt}

for i in *.txt; do
     mv "$i" "${i%.txt}.pdf"
done
for i in *.pdf; do
     cp $i Modified_dir/
done
for i in *.pdf; do
     mv "$i" "${i%.pdf}.txt"
done
