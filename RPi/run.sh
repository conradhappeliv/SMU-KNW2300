#!/bin/bash

CONFIGDIR="${HOME}/knw2300"
. $CONFIGDIR/config.txt

# run already compiled program
cd $REPODIR && java -classpath $REPODIR:$REPODIR/RXTXRobot.jar -Djava.library.path=/usr/lib/jni mainclass
