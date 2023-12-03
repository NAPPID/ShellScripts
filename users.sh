
#!/bin/bash
#USER_NAME=$1
if [ $# -gt 0 ]
then
	for USER in $@
	do
		USER_NAME=$USER
		cat /etc/passwd | grep -Ew $USER_NAME > /dev/null
			if [ $? -eq 0 ]
			then
				echo "User $USER_NAME is already created"
			else
				useradd $USER_NAME --shell /bin/bash -d /home/$USER_NAME -m
				SPECIAL_CHAR=$(echo "!@#$%^&*?()+-" | fold -1 | shuf | head -1)
				USER_PSD="Indian${RANDOM}${SPECIAL_CHAR}"
				echo "$USER_NAME:$USER_PSD" | sudo chpasswd
				echo "$USER_NAME Temporary password is $USER_PSD"
				passwd -e $USER_NAME > /dev/null
				echo "user $USER_NAME created"
			fi	
	done
else
	echo "Please enter some input string insted of empty"
fi
