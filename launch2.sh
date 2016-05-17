#!/bin/bash

MAINFLD=$1
HASH=$2

re='^[0-9]*$'
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
    for (( x=$startp; x< $end; x+=$step ))
      do
        stringa+=$MAINFLD"_"$x", "
      done
fi

if (( $end <= 31 ))
  then
    i=31
elif (( $end <= 61 ))
  then
    i=61
elif (( $end <= 93 ))
  then
    i=93
elif (( $end <= 125 ))
  then
    i=125
elif (( $end <= 157 ))
  then
    i=157
elif (( $end <= 189 ))
  then
    i=189
else
  echo "ERROR, velvet compiled until MAXKMERLENGTH=189"
fi

echo $i

/bin/velvet31_2_0_0_0/velveth $@; 

gargs=(${stringa//, / })
#echo $stringa
#echo ${gargs[@]}
if (( ${#gargs[@]} > 1 ))
  then
    for arg in ${gargs[@]}
      do
        echo $arg
        /bin/velvet31_2_0_0_0/velvetg $arg;
      done
else
  /bin/velvet31_2_0_0_0/velvetg $stringa;
fi
