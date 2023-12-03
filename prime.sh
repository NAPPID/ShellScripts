
#!/bin/bash
NUM=$1
J=0
for (( i=2; i<=$NUM; i++ ))
do
	if [ $(expr $NUM % $i) -eq 0 ]
	then
		J=$(expr $J + 1)
		#echo "value of J is $J"
	fi
done
	if [ $J -gt 1 ]
	then
		echo "$NUM is not a prime number"
	else
		echo "$NUM is a prime number"
		#echo "value of J is $J"
	fi

