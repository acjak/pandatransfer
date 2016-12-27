
function rm_id
{
        echo "Removing the secret key from the Panda1 server again."
        username=$(whoami)
        #ssh ${username}@panda.hpc.dtu.dk 'if test -f $HOME/.ssh/authorized_keys; then \
         #               rm $HOME/.ssh/authorized_keys; fi'
	ssh ${username}@panda.hpc.dtu.dk 'if test -f $HOME/.ssh/authorized_keys; then \
  		if grep -v "panda.hpc.dtu.dk" $HOME/.ssh/authorized_keys > $HOME/.ssh/tmp; then \
    			cat $HOME/.ssh/tmp > $HOME/.ssh/authorized_keys && rm $HOME/.ssh/tmp; \
  		else \
    			rm $HOME/.ssh/authorized_keys && rm $HOME/.ssh/tmp; \
  		fi; \
	fi'

}

username=$(whoami)
echo "Hello user $username."

echo "Copying home directory data from Panda1 to Panda2."
rsync -avz ${username}@panda.hpc.dtu.dk:/home/${username}/ /u/nexmap/${username}

echo "Copying data directory data from Panda1 to Panda2."
rsync -avz ${username}@panda.hpc.dtu.dk:/data/${username}/ /u/data/${username}
rm_id
sleep 10

