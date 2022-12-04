#!/bin/bash


#esercizi 1.a,1.b,1.c
a="A"
b=0

echo "PoD students"
for i in {A..Z}
do
var=$( grep -c "^$i" pod.csv )
echo "$i  $var"

if [ $b -lt $var ]; then
a=$i
b=$var
fi

done

echo "La lettera più numerosa è $a con $b ricorrenze"

a="A"
b=0


echo " ------------------------------------------"
echo " "
echo "Physics students"
for i in {A..Z}
do
var=$( grep -c "^$i" phy.csv )
echo "$i  $var"

if [ $b -lt $var ]; then
a=$i
b=$var
fi

done

echo "La lettera più numerosa è $a con $b ricorrenze"


#esercizio 1.e

filename="students.csv"

for i in {1..18}
do
for k in {0..4}
do
num=$((i+18*k))
echo $( sed -n "$num"p $filename ) >> gruppi/group$i.txt
done 
done
