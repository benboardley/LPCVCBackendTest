# LPCVCBackendTest

In this program we automate file transfer between two linux devices using Shell Scripting.

In order to run these script you may have to make sure your computer recognizes them as executables which can be done using the chmod +x filename command.

For the setup of this program one must make sure cron, and ssh are installed on the device, and that sftp is configured. In the setup Script cron is already installed
and one can Remove the comment from the ssh installment to install that as well. However many Ubuntu Linux platforms already have ssh configured.

After the installment step, the setup script creates an sshkey for the local computer and then copies this key over to the remote computer. Allowing file transfer to
take place between the computers without having to redo permissions once automated.

After the keygeneration and copying, the user needs to specify the path to the directorytransfer.sh script so that cron will be able to locate this script and execute it
at the user's specified hourly interval.

Make sure to include the full path to the folders ex: /home/username/path/to/folder when the setup script requests as otherwise sftp may not be able to locate the folders.

Anything one may wish to transfer has to be located in the specified folders.

If one wishes to remove a filetransfer job from the crontab automation they can use the crontab -e command to pullup the automated scripts and then delete those that they
wish to remove.

One can confirm file transfer by inspecting the /tmp/file as that gives an update of the files transfered and the time of execution.

Here is a link to the powerpoint explaining this program: https://docs.google.com/presentation/d/1rvtnCkjNp-egwS4B4dHH2r00ddCnsS0f904cimQ6awc/edit?usp=sharing
