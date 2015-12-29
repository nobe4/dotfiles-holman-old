# ZSH Configuration
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# manual sourcing z
. `brew --prefix`/etc/profile.d/z.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# History config
# Do not share history accross sessions
setopt nosharehistory

# SSH Config

# Complete ssh
# http://mervine.net/hacks/zsh-known-hosts-completion
# http://unix.stackexchange.com/a/52142
zstyle -s ':completion:*:(ssh|scp|sftp):*' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $_ssh_config

# CUSTOM CONFIG

# Run Gstatus at vim startup
alias vst='vim +Gstatus now'

# osg lib add
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Users/n4/efrei/M2/PFE/osg/lib

