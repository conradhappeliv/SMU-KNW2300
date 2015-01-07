#!/bin/bash

CONFIGDIR="/etc/knw2300"


CONFIGFILE=("cat ${CONFIGDIR}/config.txt")
GITHUBUSERNAME="$(sed '1q;d' ${CONFIGDIR}/config.txt)"
GITHUBREPO="$(sed '2q;d' ${CONFIGDIR}/config.txt)"

if [ -d ~/$GITHUBREPO ]; then
	# update & compile
	cd ~/${GITHUBREPO} && git pull && make
else
	# clone if not here
	cd ~ && git clone git@github.com:${GITHUBUSERNAME}/${GITHUBREPO}
	# compile
	cd $GITHUBREPO && make
fi

