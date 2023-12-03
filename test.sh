
#!/bin/bash
NUM=$1
J=0
for (( i=2; i<=$NUM; i++))
do
	echo "$i"
	J=$(expr $J + 1)
done
echo "Value of J is $J"
