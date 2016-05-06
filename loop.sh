#!/bin/sh

max_values='31 61 93 125 157 189'
categories='2 3 4 5 6 7 8 9 10 11 12 13 14 15'
openmp='0 1'
bigassembly='0 1'

cd /$DST/$FOLDER
for l in $openmp
do
  for k in $bigassembly
  do
    for j in $categories
    do	
      for i in $max_values
      do
        CRT=/$DST/velvet${i}_${j}_${k}_${l}
        mkdir $CRT
        options=''
        if [ ${k} -eq 0 ] && [ ${l} -eq 0 ];
          then options="MAXKMERLENGTH=${i} CATEGORIES=${j}";
        elif [ ${k} -eq 1 ] && [ ${l} -eq 0 ];
          then options="MAXKMERLENGTH=${i} CATEGORIES=${j} BIGASSEMBLY=1";
        elif [ ${k} -eq 0 ] && [ ${l} -eq 1 ];
          then options="MAXKMERLENGTH=${i} CATEGORIES=${j} OPENMP=1";
        else options="MAXKMERLENGTH=${i} CATEGORIES=${j} BIGASSEMBLY=1 OPENMP=1";
        fi
        make ${options}
        mv velvet* $CRT/ 
      done
    done
  done
done

exit $?
