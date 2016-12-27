#!/bin/sh

function copyid
{	
	echo "Copying secret key to Panda1 server (so you only have to enter the password once)."
	username=$(whoami)
	ssh-copy-id ${username}@panda.hpc.dtu.dk
}


copyid

echo "Copying your home directory and data directory from Panda1 to Panda2 in the background. To see the progress use the command 'screen -r pandatransfer'. To leave the progress screen press CTRL+A followed by D."
echo "The transfer process might take hours depending on how much space you use on Panda1."
echo ""

exec screen -S pandatransfer -dm bash -c 'sh pandacopy.sh'
