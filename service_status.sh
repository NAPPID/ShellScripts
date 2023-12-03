
#!/bin/bash
A=$1
B=$2
echo "given input is $A --> $B"
echo $#
echo $*
echo $0
echo $@

if [ $# -ne 0 ]
then
 STATUS=$(service $A status 2>&1 /tmp/error.log | grep -i "running")
 	if [ $? -eq 0 ]
	then
		PID=$(sudo ps -ef | grep -iE $A | grep -v "grep" | sort | awk '{print $2}' | head -n 1)
		PORT=$(sudo netstat -ntlp | grep -i "$PID" | grep -Ew "tcp" | awk '{print $4}' | cut -d ':' -f 2)
		echo "Process ID for $A ----> $PID"
		echo "Port for $A ----> $PORT"
	else
		echo " service $A not running, hense script attempting to run this"
		sudo service $A start
	fi
else
	echo " Please pass proper inputs $#"
fi

