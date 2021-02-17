#!/usr/bin/env bash
sleep 2s;  # xrandr doesn't seem to update immediately
CURRENT=$(xrandr | grep "^[A-Z]\+-[0-9-]\+ connected" | sed -e "s/^\(\S*\).*/\1/")
OFF=$(xrandr | grep "^[A-Z]\+-[0-9-]\+ disconnected" | sed -e "s/^\(\S*\).*/\1/")

xrandr $(
    python -c "print(' '.join(
    [' --output {} --auto --left-of eDP-1'.format(display)
     for display in '''${CURRENT}'''.split('\n')] if '''${CURRENT}''' else '' 
))
print(' '.join(
    [' --output {} --off'.format(display)
     for display in '''${OFF}'''.split('\n')] if '''${OFF}''' else '' 
))
" \
) --output eDP-1 --auto;

$(dirname "$0")/random-wallpaper.py
