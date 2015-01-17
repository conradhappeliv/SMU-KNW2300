#!/bin/bash

CONFIGDIR="${HOME}/knw2300"

# get github repository
echo "Enter your Github repository's username followed by the enter key (ex: johndoe24)"
read githubusername
printf "\nEnter your Github repository's name followed by the enter key (ex: robotrepo)\n"
read githubrepo
printf "\n"

# create configuration directory
[ -d $CONFIGDIR ] || (echo "Creating config dir: "$CONFIGDIR && mkdir -p $CONFIGDIR)

# add button watcher to startup scripts
sudo cp ./start_button_watch.sh /etc/init.d
sudo update-rc.d start_button_watch.sh defaults

# generate SSH key
[ -e ${CONFIGDIR}/id_rsa.pub ] || (echo "Generating SSH key: ${CONFIGDIR}/id_rsa" && ssh-keygen -qf ${CONFIGDIR}/id_rsa -N "")
echo "Host github.com" >> "${HOME}/.ssh/config"
echo "  IdentityFile ${CONFIGDIR}/id_rsa" >> "${HOME}/.ssh/config"

# create config file
echo "Writing config file: "${CONFIGDIR}"/config.txt"
echo "GITHUBUSERNAME=${githubusername}" > "${CONFIGDIR}/config.txt"
echo "GITHUBREPO=${githubrepo}" >> "${CONFIGDIR}/config.txt"

# Add SSH deploy key to Github
curl -s --user "${githubusername}" --data "{\"title\":\"knw2300rpi\",\"key\":\"$(cat ${CONFIGDIR}/id_rsa.pub)\"}" https://api.github.com/repos/${githubusername}/${githubrepo}/keys > /dev/null


echo "Reboot for changes to take effect"
