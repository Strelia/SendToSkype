sleep 10s

wget --auth-no-challenge --http-user=admin --http-password=20ba3ef2815c485e86ff1556e7ffb6e6  $2/consoleText

FILE_LOG="$(pwd)/consoleText"

message=$(cat $FILE_LOG | grep -a Finished:)
echo "Message :"$message
rm consoleText*

if [ -z "$message" ]
  then
	message="Build without finished"
fi
if [ -z $3 ]
then
   message=$message" "$2

   skypeIP=10.13.70.135
   for recipient in $1
   do
 	if [[ $recipient == "#"* ]]
 	then
  	ssh skype@$skypeIP  "/home/skype/sendimGroup.sh $recipient '$message'"
 	else
  	ssh skype@$skypeIP "/home/skype/sendimUser.sh $recipient '$message'"
 	fi
   done
else
 	if [[ $message != "Finished: SUCCESS" ]]
  	then
   	message=$message" "$2
    	skypeIP=10.13.70.135
    	for recipient in $1
    	do
     	if [[ $recipient == "#"* ]]
     	then
        	ssh skype@$skypeIP  "/home/skype/sendimGroup.sh $recipient '$message'"
     	else
         	ssh skype@$skypeIP "/home/skype/sendimUser.sh $recipient '$message'"
     	fi
   	done
  	fi
fi
