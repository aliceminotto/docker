#!/bin/sh

max_values='31 61 93 125 157 189'
categories='2 3 4 5 6 7 8 9 10 11 12 13 14 15'
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
        mkdir /$DST/velvet${i}_${j}_${k}_${l}
      done
    done
  done
done

exit $?
