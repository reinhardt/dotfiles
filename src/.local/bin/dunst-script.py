#!/usr/bin/env python
import subprocess
import sys

_, appname, summary, body, icon, urgency = sys.argv

if "Tea" in summary:
    subprocess.call(["aplay /home/reinhardt/Sounds/MW2/HEATLEVL.WAV"], shell=True)
elif " wrote: " in body or "mattermost" in body:
    subprocess.call(["aplay /home/reinhardt/Sounds/MW2/acquire.wav"], shell=True)
elif summary == "Battery critical":
    subprocess.call(["aplay /home/reinhardt/Sounds/MW2/critdestr.wav"], shell=True)
