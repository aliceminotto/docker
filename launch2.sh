#!/bin/bash

MAINFLD=$1
HASH=$2

re='^[0-9]$'
stringa=""

if [[ $HASH =~ $re ]]
  then 
    stringa+=$MAINFLD
    end=$HASH
  else
    kmers=(${HASH//,/ })
    startp=${kmers[0]}
    end=${kmers[1]}
    step=${kmers[2]}
    for (( x=$startp; x<$end; x+=$step ))
      do
        stringa+=$MAINFLD"_"$x", "
      done
fi

if [ $end -le 31 ]
  then
    i=31
elif [ $end -le 61 ]
  then
    i=61
elif [ $end -le 93 ]
  then
    i=93
elif [ $end -le 125 ]
  then
    i=125
elif [ $end -le 157 ]
  then
    i=157
elif [ $end -le 189 ]
  then
    i=189
else
  echo "ERROR, velvet compiled until MAXKMERLENGTH=189"

echo $i

/bin/velvet31_2_0_0_0/velveth $@; /bin/velvet31_2_0_0_0/velvetg $stringa
