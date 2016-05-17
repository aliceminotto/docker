#!/bin/bash

MAINFLD=$1
HASH=$2

LONGSEQ="${@: -1:1}"
OPENMP="${@: -2:1}"
BIGASSEMBLY="${@: -3:1}"
CATEGORIES="${@: -4:1}"

echo $LONGSEQ $OPENMP $BIGASSEMBLY $CATEGORIES
hargs=${@:1: (($#-4))}
echo $hargs

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
  exit 1
fi

if (( $CATEGORIES > 15 ))
  then
    echo "ERROR, velvet compiled with max of 15 channels"
    exit 1
elif (( $CATEGORIES < 2 ))
  then
    echo "ERROR, velvet compiled with min of 2 channels"
    exit 1
else
  j=$CATEGORIES
fi

if [ "$BIGASSEMBLY" = true ]
  then
    k=1
else
  k=0
fi

if [ "$OPENMP" = true ]
  then 
    l=1
else
  l=0
fi

if [ "$LONGSEQ" = true ]
  then
    m=1
else
  m=0
fi

/bin/velvet${i}_${j}_${k}_${l}_${m}/velveth $hargs; 

gargs=(${stringa//, / })
#echo $stringa
#echo ${gargs[@]}
if (( ${#gargs[@]} > 1 ))
  then
    for arg in ${gargs[@]}
      do
        echo $arg
        /bin/velvet${i}_${j}_${k}_${l}_${m}/velvetg $arg;
      done
else
  /bin/velvet${i}_${j}_${k}_${l}_${m}/velvetg $stringa;
fi

