#!/usr/local/bin/bash
###########################################################################################################################
# Setup usage message and args
USAGE="Please supply both a valid version and environment. USAGE:  $0 -v|--version(=|:) <version> -e|--env(=|:) <(prod|stage)>"
#
###########################################################################################################################

./parseOpts.sh :-v,--version :-e,--env $@


if [[ "$?" -ne "0" ]] ; then
    exit 1
fi

echo "hi"




