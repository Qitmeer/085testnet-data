#!/bin/bash

FILE=payledger.output.txt

if [ ! -z $1 ]; then
  if [ -e $1 ]; then
    FILE=$1
  fi 
fi

sum1=0
sum2=0
cat $FILE|grep Tm|sed s/Address://|sed s/GenAmount.*Total:\ *//|cut -d ' ' -f1,3|while read a b
do 
  result=$(grep $a wallet_balance_542370.txt)
  if [ ! -z "$result" ]; then 
    o=$(echo $result|cut -d ' '  -f1)
    a2=$(echo $result|cut -d ' ' -f2)
    b2=$(echo $result|cut -d ' ' -f3)
    echo -n find  address $a2
    echo -n order $o
    echo " balance $b2"
    b3=$(echo $b2-$b|bc)
    sum1=$(echo $sum1+$b|bc)
    sum2=$(echo $sum2+$b2|bc)
    if [ "$b3" != "0" ]; then
      echo -n "not match result : $result"
      echo " -> ledger is $b, wallet is $b2"
    fi
  else
    echo "not find : $a"
  fi
  echo "sum is $sum1 , $sum2"
done




