
#!/bin/bash
for i in {1..20}
do
	if [ $(expr $i % 2) -eq 0 ]
	then
		echo "Even number is $i"
	else
		echo "Odd number is $i"
	fi
done
