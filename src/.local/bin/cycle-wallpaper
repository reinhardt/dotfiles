#!/usr/bin/env python3
import subprocess
from datetime import date
from pathlib import Path
from random import choice
from random import seed

src_dir = Path("~/.backgrounds").expanduser()
seed(date.today().toordinal())
new_wallpaper = src_dir.joinpath(choice([img for img in src_dir.iterdir()]))
subprocess.run("nitrogen --save --head=0 --set-zoom".split(" ") + [new_wallpaper])
subprocess.run("nitrogen --save --head=1 --set-zoom".split(" ") + [new_wallpaper])
