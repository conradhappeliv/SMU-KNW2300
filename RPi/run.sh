#!/bin/bash

CONFIGDIR="${HOME}/knw2300"
. $CONFIGDIR/config.txt

# run already compiled program
cd $REPODIR && java mainclass.class
