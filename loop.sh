#!/bin/sh

max_values='31 61 93 125 157 189'
categories={1..15}
openmp='0 1'
bigassembly='0 1'

for l in $openmp
do
  for k in $bigassembly
  do
    for j in $categories
    do	
      for i in $max_values
      do
        mkdir $DST/velvet${maxvalues}_${categories}_k_l
      done
    done
  done
done

exit $?
