#!/bin/bash
# An example of a simple command line script that supports options
# Examples of how to use:
# ./cliargs.sh -h 
# ./cliargs.sh -r
# ./cliargs.sh -m "Hello, world!"
# ./cliargs.sh -u GitHubUser123 -m Hi


### Functions which will do the things ###
# Function to log usage message
# https://en.wikipedia.org/wiki/Usage_message
usage() {
    echo ""
    echo "Usage: ./cliargs.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h                see usage instructions"
    echo "  -m <message>      say a message"
    echo "  -r                print the result of a random dice roll"
    echo "  -u <username>     set the username"
}

### Prep flags to determine what will happen ###
hflag=false
mflag=false
marg=""
rflag=false
uflag=false
uarg=""

### Read input options and set flags ###
# https://www.mkssoftware.com/docs/man1/getopts.1.asp
# https://www.baeldung.com/linux/use-command-line-arguments-in-bash-script
while getopts hm:ru: flag
do
    case "${flag}" in
        h) hflag=true;;
        m) mflag=true; marg=$OPTARG;;
        r) rflag=true;;
        u) uflag=true; uarg=$OPTARG;;
    esac
done

### Perform actions based on flags ###
# Print the usage output and exit
if $hflag; then
    usage
    # exit early if calling help
    exit
fi

# Set person to "anonymous"
# If -u is set, overwrite person with the provided value 
person="anonymous"
if $uflag; then
    person=$uarg
fi

# If -m is set, log message sent by person
if $mflag; then
    echo "$person said: $marg"
fi

# If -r is set, log the dice roll by person
if $rflag; then
    number=$(($RANDOM%6+1))
    echo "$person rolled a $number"
fi