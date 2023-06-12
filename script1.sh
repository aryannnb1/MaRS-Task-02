#!/bin/bash
#takiing directory input
directory=${pwd}
#printing the directory
echo $directory
#making new directory
mkdir Modified_dir

file=${grep/.txt}

#loop to check for txt files and creating .bak files from them
for i in *.txt; do
     mv "$i" "${i%.txt}.bak"
done
#loop to check for bak files and copying them to modified directory
for i in *.bak; do
     cp $i Modified_dir/
done
#moving txt files
for i in *.bak; do
     mv "$i" "${i%.bak}.txt"
done
