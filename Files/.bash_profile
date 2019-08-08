# Bash_Startup_Files
# https://github.com/AlanTBarlow/Bash_Startup_Files
#
# Copyright (c) 2019 Alan T Barlow

# This document is where you put your environment variables and functions and is only
# loaded upon initializing a login shell.

# loads the .bash_path file to get path
if [ -f ~/.bash_path ]; then . ~/.bash_path; fi

# loads .bashrc file to get aliases and prompt
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
