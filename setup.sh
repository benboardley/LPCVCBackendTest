#! /bin/bash
sudo apt-get update --user
sudo apt-get install cron --user
echo "Enter the user and host name of the computer you would like to transfer files with (ex. username@hostname.com) ->"
read computertoconnect
#ssh-keygen-t rsa
#ssh-copy-id $computertoconnect

#echo "What file type would you like to share between the two computers (ex. .txt, .py, etc. if multiple include with spaces inbetween) -> "
#read -a arr

echo "How many hours between syncs (1 , 2 ...) ->"
read hours

echo "Is there a specific directory you would like the files copied from in the local computer (Please use full path ex: mine would be /home/shay/a/bboardle/Folder)-> "
read hostreaddir

echo "Is there a specific directory you would like the files copied to in the local computer (if not a folder with the remote computer's name will be created)-> "
read hostcopydir

echo "Is there a specific directory you would like the files copied from in the remote computer (mine would be /home/shay/a/bboardle/Folder)-> "
read remotereaddir

echo "Is there a specific directory you would like the files copied to in the remote computer (if not a folder with the local computer's name will be created)-> "
read remotecopydir

for elem in ${arr[@]}
do 
  echo $elem
done
#echo "$hours hours $hostcopydir host copy dir $hosttodir host recieve dir  $remotecopydir remote copy dir  $remotetodir remote recieve dir "

./directorytransfer.sh $computertoconnect $remotereaddir $hostcopydir $hostreaddir $remotecopydir

while true
do
echo "Did this execute correctly (yes or no)? If no it will reset for you to reconfigure if yes it will setup for the transfer every $hours hours: "
read n
if [ $n = "yes" ]
then
echo "Initiating automation"
exit
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
(crontab -l ; echo "*/5 * * * * ./directorytransfer.sh $computertoconnect $remotereaddir $hostcopydir $hostreaddir $remotecopydir") | crontab -