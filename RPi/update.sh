#!/bin/bash

CONFIGDIR="${HOME}/knw2300"
. $CONFIGDIR/config.txt

if [ -d ~/$GITHUBREPO ]; then
	# update & compile
	cd $REPODIR && git pull
else
	# clone if not here
	cd ${HOME} && git clone git@github.com:${GITHUBUSERNAME}/${GITHUBREPO} && echo "REPODIR=${PWD}/${GITHUBREPO}" >> "${CONFIGDIR}/config.txt"
fi

