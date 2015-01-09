#!/bin/bash

CONFIGDIR="/etc/knw2300"


# check for root (needed to write to /etc)
if [ "$(id -u)" != "0" ]; then
	echo "Please run this script as root. (\$sudo setup.sh)"
	exit 1
fi

# get github repository
echo "Enter your Github repository's username followed by the enter key (ex: johndoe24)"
read githubusername
printf "\nEnter your Github repository's name followed by the enter key (ex: robotrepo)\n"
read githubrepo
printf "\n"

# create configuration directory
[ -d $CONFIGDIR ] || (echo "Creating config dir: "$CONFIGDIR && mkdir -p /etc/knw2300)

# generate SSH key
[ -e ${CONFIGDIR}/id_rsa.pub ] || (echo "Generating SSH key: ${CONFIGDIR}/id_rsa" && ssh-keygen -qf ${CONFIGDIR}/id_rsa -N "" && eval $(ssh-agent) > /dev/null && ssh-add ${CONFIGDIR}/id_rsa)

# create config file
echo "Writing config file: "${CONFIGDIR}"/config.txt"
echo $githubusername > "${CONFIGDIR}/config.txt"
echo $githubrepo >> "${CONFIGDIR}/config.txt"

# Add SSH deploy key to Github
curl -s --user "${githubusername}" --data "{\"title\":\"knw2300rpi\",\"key\":\"$(cat ${CONFIGDIR}/id_rsa.pub)\"}" https://api.github.com/repos/${githubusername}/${githubrepo}/keys > /dev/null
