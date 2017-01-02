# pandatransfer
Transfers personal data from old Panda1 server to the new Panda2 server using Screen and SSH keys. 

You need to have the same login name for both servers for this script to work.

**Note that the script ends with deleting the .ssh/authorized\_keys after completion. If you have never heard of SSH keys and the ssh-copy-id command, that is probably ok.**

## How to use:
* Open a terminal on Panda2, either using ThinLinc or an SSH connection.
* Clone this repository to Panda2:
```bash
$ git clone https://github.com/acjak/pandatransfer.git
```
* Got to the new directory:
```bash
$ cd pandatransfer
```
* Run the script:
```bash
$ sh pandatransfer.sh
```
* You will be asked for the password for your Panda1 login.

The transfer should now be running in the background, even when closing the SSH or ThinLinc connection. To see the progress  use the command
```bash
$ screen -dr pandatransfer
```
To leave this screen again, press CTRL+A followed by D. If there is no screen matching the name pandatransfer, the transfer of files from Panda1 to Panda2 is completed.
