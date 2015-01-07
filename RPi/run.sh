#!/bin/bash

CONFIGDIR="/etc/knw2300"


CONFIGFILE=("cat ${CONFIGDIR}/config.txt")
GITHUBREPO="$(sed '2q;d' ${CONFIGDIR}/config.txt)"

# run already compiled program
cd ~/${GITHUBREPO} && make run
