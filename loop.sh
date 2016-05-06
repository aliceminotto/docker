#!/bin/sh

max_values='31 61 93 125 157 189'
categories='2 3 4 5 6 7 8 9 10 11 12 13 14 15'
openmp='0 1'
bigassembly='0 1'
longsequences='0 1'

cd /$DST/$FOLDER
for m in $longsequences
do
  for l in $openmp
  do
    for k in $bigassembly
    do
      for j in $categories
      do	
        for i in $max_values
        do
          CRT=/$DST/velvet${i}_${j}_${k}_${l}_m
          mkdir $CRT
          options=''
          options="MAXKMERLENGTH=${i} CATEGORIES=${j}"
          if [ ${k} -eq 1 ]; then
            options+=" BIGASSEMBLY=1";
          fi
          if [ ${l} -eq 1 ]; then
            options+=" OPENMP=1";
          fi
          if [ ${m} -eq 1 ]; then
            options+=" LONGSEQUENCES=1";
          fi
          make ${options}
          mv velvet* $CRT/ 
        done
      done
    done
  done
done

exit $?
