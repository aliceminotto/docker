#!/bin/sh

MAINFLD=$1
HASH=$2

re='^[0-9]$'
stringa=""

if [[ $HASH =~ $re ]]
  then 
    stringa+=$MAINFLD
  else
    kmers=(${HASH//,/ })
    start=${kmers[0]}
    end=${kmers[1]}
    step=${kmers[2]}
    for (( x=$start; x<$end; x+=$step ))
      do
        stringa+=$MAINFLD"_"$x", "
      done
fi

echo $stringa
