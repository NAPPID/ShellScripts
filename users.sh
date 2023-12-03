
#!/bin/bash
USER_NAME=$1
cat /etc/passwd | grep -Ew $USER_NAME > /dev/null
if [ $? -eq 0 ]
then
	echo "User $USER_NAME is already created"
else
	useradd $USER_NAME
	echo "user $USER_NAME created"
fi	
