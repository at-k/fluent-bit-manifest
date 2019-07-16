#!/bin/zsh


byte=$1
count=0
ttl=0


file=data.dat

rm $file

while [ 0 ]; do
  echo "$count\c" >> $file
  count=$(( count+1 ))
  ttl=$(( ttl+1 ))
  if [ $count -gt 9 ]; then
    count=0
  fi
  if [ $ttl -ge $byte ]; then
    break;
  fi
done
