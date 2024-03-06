# Nice Colors for LS
export LSCOLORS=GxFxCxDxBxegedabagaced

export VISUAL=vim
export EDITOR="$VISUAL"

export LANG=en_US.UTF-8 
export LANGUAGE=en.UTF-8

source ~/.bash_prompt

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Add github ssh key
if ps -p $SSH_AGENT_PID > /dev/null
then
   echo "ssh-agent is already running"
else
eval `ssh-agent -s`
fi
