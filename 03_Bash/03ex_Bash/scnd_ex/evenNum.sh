#!/bin/bash

#parte relativa ai numeri pari

filename="data.txt"
even_nums=0
n_lines=$( sed -n '$=' $filename )
var0="$( echo 'scale=2;sqrt(3)*100/2' | bc)"

big1_nums=0
big2_nums=0

for i in $(seq $n_lines); do
	for j in {1..6}; do
    		
    		#check numeri pari
    		a=$( sed -n "${i}p" < $filename | cut -d " " -f $j)
    		
    		if [[ $(( a%2 )) -eq 0 ]]; then
    			even_nums=$(( even_nums +1 ))
    		fi
    	done
    	#check triple magiche
    	x=$( sed -n "${i}p" < $filename | cut -d " " -f 1 )
    	y=$( sed -n "${i}p" < $filename | cut -d " " -f 2 )
    	z=$( sed -n "${i}p" < $filename | cut -d " " -f 3 )
    	x1=$( sed -n "${i}p" < $filename | cut -d " " -f 4 )
    	y1=$( sed -n "${i}p" < $filename | cut -d " " -f 5 )
    	z1=$( sed -n "${i}p" < $filename | cut -d " " -f 6 )
    	
    	var="$( echo "scale=2;sqrt($x*$x+$y*$y+$z*$z)" | bc )"
    	var1="$( echo "scale=2;sqrt($x1*$x1+$y1*$y1+$z1*$z1)" | bc )"
    	
    	if (( $(echo "$var > $var0" |bc -l) )); then
        	let big1_nums+=1
    	fi

   	 if (( $(echo "$var1 > $var0" |bc -l) )); then
       		let big2_nums+=1
    	fi

    	
done

echo "There are $even_nums even numbers"
echo "$big1_nums numbers are bigger than $var0 in the first 3 columns groups"
echo "$big2_nums numbers are bigger than $var0 in the last 3 columns groups"


#manca da fare il punto d

