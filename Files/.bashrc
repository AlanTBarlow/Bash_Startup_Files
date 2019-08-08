# Bash_Startup_Files
# https://github.com/AlanTBarlow/Bash_Startup_Files
#
# Copyright (c) 2019 Alan T Barlow

# This document is where you store variables that are needed before loading the prompt and aliase files

# The following ANSI Escape Codes are to be used inside your custom functions using "printf"
# Go to https://en.wikipedia.org/wiki/ANSI_escape_code#Colors for more codes.
#
# ANSI colors
black='\e[30m'
red='\e[31m'
green='\e[32m'
yellow='\e[33m'
blue='\e[34m'
purple='\e[35m'
cyan='\e[36m'
white='\e[37m'
#
# ANSI SGR
reset='\e[0m'
bold='\e[1m'
italic='\e[3m'
underline='\e[4m'

# Defines a "printf" string that resets its style after being declaired.
string="%s${reset}"
boldString="${bold}${string}"

# checks if the initialized shell is a login shell and prints the output.
shopt -q login_shell && echo 'A login shell has been initialized, all files have been loaded.' \
|| echo 'A non-login shell has been initialized, the .bash_profile and .bash_path files have NOT been loaded.'

# load the .bash_aliases file to get the aliases
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

# load the .bash_prompt file to get the prompt
if [ -f ~/.bash_prompt ]; then . ~/.bash_prompt; fi
