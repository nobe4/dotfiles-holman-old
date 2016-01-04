# vagrant alias
alias vre="vagrant halt && tm vagrant up"

# Check if the current folder has a vagrant environment
_vagrant_check(){
	vagrantStatus="$(vagrant status 2>&1)"
	if echo $vagrantStatus | grep -q 'environment' ; then
		echo 'Not a vagrant environment, exiting ...'
		return 1
  else
    return 0
	fi
}

_vagrant_is_up(){
	vagrantStatus="$(vagrant status 2>&1)"
	if echo $vagrantStatus | grep -q 'saved\|aborted\|poweroff' ; then
		return 1
  else
    return 0
	fi
}

# Custom ssh function
vsh(){
	# getting all output of the vagrant status command
	if ! _vagrant_check; then return; fi
	if ! _vagrant_is_up; then
		echo 'Restoring the machine state ...'
		vagrant up
	fi
	echo 'ssh to the machine'
	vagrant ssh
}

vup(){
	if ! _vagrant_check; then return; fi
	if ! _vagrant_is_up; then
		vagrant up
	fi
  notify "Vagrant started"
}

vhalt(){
	if ! _vagrant_check; then return; fi
	if _vagrant_is_up; then
		vagrant halt
	fi
  notify "Vagrant halted"
}
