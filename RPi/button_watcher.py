#!/usr/bin/env python

import RPi.GPIO as GPIO
import subprocess
import time

# setup
GPIO.setmode(GPIO.BOARD)
GPIO.setup(26, GPIO.IN, pull_up_down = GPIO.PUD_UP)
GPIO.setup(23, GPIO.IN, pull_up_down = GPIO.PUD_UP)
run_process = subprocess.Popen("exec", shell=True) # "empty" constructor? Probably a better way to do this

# main loop
while True:
    if(GPIO.input(23) == False):
        subprocess.call("/home/pi/SMU-KNW2300/RPi/update.sh", shell=True)
        time.sleep(2)
    if(GPIO.input(26) == False):
	if run_process.poll() is not None:
		run_process.terminate()
        run_process = subprocess.Popen("exec /home/pi/SMU-KNW2300/RPi/run.sh", shell=True) # exec so run.sh inherits the shell process
        time.sleep(2)
