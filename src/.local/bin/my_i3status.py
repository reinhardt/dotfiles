#!/usr/bin/env python3
import os
import subprocess


TRACKING_DIR = os.path.expanduser("~/Timetracking/2020/")
OCTODON_BIN = "/home/reinhardt/projects/hamster/octodon/py3/bin/octodon"

with subprocess.Popen(
    "i3status", stdout=subprocess.PIPE, stdin=subprocess.DEVNULL
) as i3status:
    for line in i3status.stdout:
        #octodon_summary = subprocess.run(
        #    "timeout 5s {} --new-session --date=+0 total".format(OCTODON_BIN),
        #    stdout=subprocess.PIPE,
        #    shell=True,
        #).stdout
        octodon_summary = "x"
        octodon_summary = " {} ".format(octodon_summary.decode("utf-8").strip())

        tracking_files = os.listdir(TRACKING_DIR)
        tracking_files.sort(
            key=lambda f: os.stat(os.path.join(TRACKING_DIR, f)).st_mtime
        )
        newest_file = os.path.join(TRACKING_DIR, tracking_files[-1])
        with open(newest_file) as tracking_data:
            last_line = tracking_data.readlines()[-1]
            last_line = " {} ".format(last_line.strip())
        line_parts = line.decode("utf-8").strip().split("|")

        print(
            "|".join(
                line_parts[:-2] + [octodon_summary] + [last_line] + line_parts[-2:]
            )
        )
