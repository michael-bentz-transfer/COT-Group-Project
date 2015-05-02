#!/bin/bash
# takes arguments:
# 1: data file
# 2: output file base name

for i in 10 20 30 40 50
do
    echo "classifyData('../datasets/${1}', $i)" | matlab -nodesktop -nojvm -nosplash > ../output/${2}-${i}-percent.out
done
