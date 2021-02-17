#!/usr/bin/env bash
export XAUTHORITY=$HOME/.Xauthority
export DISPLAY=:0
source /home/reinhardt/.dbus/session-bus/$(cat /etc/machine-id)-0
export DBUS_SESSION_BUS_ADDRESS
#export DBUS_SESSION_BUS_ADDRESS="unix:abstract=/tmp/dbus-Hy3fTTPUb5,guid=7a3365a37946c200691e06015d09b3e9"
#echo $DBUS_SESSION_BUS_ADDRESS > /tmp/battery-notification;
STATUS=$(cat /sys/class/power_supply/BAT0/status);
if [[ $STATUS == 'Discharging' ]]; then
    CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity);
    REMAINING=$(python3 -c "print(int("$(cat /sys/class/power_supply/BAT0/energy_now)" / "$(cat /sys/class/power_supply/BAT0/power_now)" * 60))")
    echo $CAPACITY >&2;
    if [[ $CAPACITY -lt 10 || $REMAINING != "" && $REMAINING -lt 10 ]]; then
        /usr/bin/env notify-send --urgency=critical --icon=battery-level-0-symbolic "Battery critical" "The battery level is $CAPACITY% ($REMAINING min remaining). Plug in your charger now.";
    elif [[ $CAPACITY -lt 20 || $REMAINING != "" && $REMAINING -lt 30 ]]; then
        /usr/bin/env notify-send --urgency=normal --icon=battery-level-20-symbolic "Battery low" "The battery level is $CAPACITY% ($REMAINING min remaining).";
    fi
fi
