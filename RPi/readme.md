Raspberry Pi Setup
------------------

1. Clone this repository to the Raspberry Pi
2. Run the `setup.sh` script, giving it the individual team's repository information

`setup.sh` stores the username/repo to disk, makes sure the RPi has an SSH key available, and uploads that key as a deploy key on Github for automated deployment.

`update.sh` handles cloning/updating the team's repository on the RPi. 

`run.sh` will start the program.
