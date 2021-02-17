#!/usr/bin/env bash
PID=$(ps -C syndaemon -o pid --no-headers);
if [[ $PID == "" ]]; then
    syndaemon -i 0.7 -d;
else
    kill $PID;
fi
