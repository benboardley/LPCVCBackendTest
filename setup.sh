#! /bin/bash
sudo apt-get update
sudo apt-get install cron
#sudo apt-get install ssh
#addgroup sftp

echo "Enter the user and host name of the computer you would like to transfer files with (ex. username@hostname.com) ->"
read computertoconnect
ssh-keygen-t rsa
ssh-copy-id $computertoconnect


echo "What is the path to the directorytransfer script? (ex: /home/username/LPCVCBackendTest/directorytransfer.sh"
read scriptpath

echo "How many hours between syncs (1 , 2 ...) ->"
read hours

echo "Is there a specific directory you would like the files copied from in the local computer (Please use full path /home/username/path/Folder)-> "
read hostreaddir

echo "Where would you like the files/directories copied on the local computer-> (follow same format as above)->"
read hostcopydir

echo "Is there a specific directory you would like the files copied from in the remote computer (/home/username/path/Folder)-> "
read remotereaddir

echo "Where would you like the files/directories copied on the reomte computer (follow same format as above)->"
read remotecopydir


$scriptpath $computertoconnect $remotereaddir $hostcopydir $hostreaddir $remotecopydir

while true
do
echo "Did this execute correctly (yes or no)? If no it will reset for you to reconfigure if yes it will setup for the transfer every $hours hours: "
read n
if [ $n = "yes" ]
then
echo "Initiating automation"
break
else
if [ $n = "no" ]
then
echo "Let's reconfigure"
./setup.sh
exit
else
echo "non-acceptable entry ... Press enter to continue"
read phew
fi
fi
done
(crontab -l ; echo "0 */$hours  *  * * $scriptpath $computertoconnect $remotereaddir $hostcopydir $hostreaddir $remotecopydir >> /tmp/file") | crontab -