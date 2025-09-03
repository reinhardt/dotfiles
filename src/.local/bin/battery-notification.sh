#!/usr/bin/env bash
STATUS=$(cat /sys/class/power_supply/BAT0/status);
if [[ $STATUS != 'Charging' ]]; then
    ENERGY=$(/usr/bin/env python3 -c "print('{:.0f}'.format("$(cat /sys/class/power_supply/BAT0/energy_now)" / "$(cat /sys/class/power_supply/BAT0/energy_full_design)" * 100))");
    TIME=$(/usr/bin/env python3 -c "print(int("$(cat /sys/class/power_supply/BAT0/energy_now)" / "$(cat /sys/class/power_supply/BAT0/power_now)" * 60))")
    echo $ENERGY $TIME >&2;
    if [[ $ENERGY -lt 10 || ( $TIME != "" && $TIME -lt 20 ) ]]; then
        notify-send --urgency=critical --icon=battery-level-0-symbolic "Battery critical" "The battery level is $ENERGY% ($TIME min remaining). Plug in your charger now.";
    else
        notify-send --urgency=normal --icon=battery-level-20-symbolic "Battery low" "The battery level is $ENERGY% ($TIME min remaining).";
    fi
fi
