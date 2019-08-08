# Bash_Startup_Files
# https://github.com/AlanTBarlow/Bash_Startup_Files
#
# Copyright (c) 2019 Alan T Barlow

# This document is where you put your aliases and alias functions.

# Prints text upon being called to remind user of the command to see all aliases.
printAliasHint() {
    # The format used for the text.
    local format="\n${string} '${boldString}'.\n"

    # Print the 2 strings using the format above.
    printf "${format}" "To view all available aliases, type" "getAliases"
}

# Prints a list of aliases upon being called.
getAliases() {
    # The format for the header text
    local headerFormat="\n${yellow}${underline}${boldString}\n\n"

    # The format for the text of each alias in the list.
    local itemFormat="${yellow}${boldString}: ${string}\n\n"

    # Prints the header using the headerFormat above.
    printf "${headerFormat}" "Available Aliases"

    # Prints each alias using the itemFormat above as well as the index to get each item
    # from aliasNames and aliasDescriptions
    for index in ${!aliasNames[@]}; do
        printf "${itemFormat}" "${aliasNames[index]}" "${aliasDescriptions[index]}"
    done
}

# Creates the arrays used in the addAlias and getAliases functions
aliasNames=()
aliasDescriptions=()

# A function that provides an easy way to create an alias and add it to the list of all aliases for use
# with the getAlias function.
#
# Expects 3 parameters the name, the command, and the description.
addAlias() {
    # Creates the alias using parameter 1 as the name and parameter 2 as the command.
    alias ${1}="${2}"

    # Adds the associating parameter to its array
    aliasNames+=("${1}")
    aliasDescriptions+=("${3}")
}

# add aliases using the following format: addAlias "name" "command" "desctription"

addAlias "restart" "reset && exec bash" \
    "Clears the command line and initializes a non-login shell, use '-l' after the alias to initialize a login shell."

addAlias "edit-aliases" "open ~/.bash_aliases" \
    "Opens the .bash_aliases file using the default text editor, use '-a \"application name\"' after the alias to use a different editor."

addAlias "edit-prompt" "open ~/.bash_prompt" \
    "Opens the .bash_prompt file using the default text editor, use '-a \"application name\"' after the alias to use a different editor."

addAlias "edit-path" "open ~/.bash_path" \
    "Opens the .bash_path file using the default text editor, use '-a \"application name\"' after the alias to use a different editor."

# Calls this function upon shell initialization.
printAliasHint