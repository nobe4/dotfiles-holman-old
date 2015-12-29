# vagrant alias
alias vre="vagrant halt && tm vagrant up"

# Custom ssh function
vsh(){
	# getting all output of the vagrant status command
	vagrantStatus="$(vagrant status 2>&1)"
	if echo $vagrantStatus | grep -q 'environment' ; then
		echo '\e[34m[VSH] \e[0mNot a vagrant environment, exiting ...'
		return;
	fi
	if echo $vagrantStatus | grep -q 'saved\|aborted\|poweroff' ; then
		echo '\e[34m[VSH] \e[0mRestoring the machine state ...'
		vagrant up
	fi
	echo '\e[34m[VSH] \e[0mssh to the machine'
	vagrant ssh
}

