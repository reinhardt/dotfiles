#!/usr/bin/env bash
function update_channel() {
    # If running nixos-rebuild within container, update channel first
    if [[ $(nixos-container status $CONTAINER) == "up" ]]; then
        WAS_RUNNING=1;
    else
        WAS_RUNNING=0;
        nixos-container start $CONTAINER;
    fi
    CHANNEL=$(nix-channel --list | grep "^nixos " | sed -e "s/^nixos //")
    nixos-container run $CONTAINER -- nix-channel --add $CHANNEL nixos;
    nixos-container run $CONTAINER -- nix-channel --update;
    if [[ $WAS_RUNNING = "0" ]]; then
        nixos-container stop $CONTAINER;
    fi
}

for CONTAINER in $(nixos-container list); do
    echo $CONTAINER;

    # To pin to a certain channel state
    #NIX_PATH=nixpkgs=/nix/store/hwhrc541xw2r6mgy5v8qraxckm6zvqfa-nixos-20.09pre215752.9d0fac46fd0/nixos nixos-container update $CONTAINER;
    nixos-container update $CONTAINER >/tmp/${CONTAINER}-update.log 2>&1;
    nix-env -p /nix/var/nix/profiles/per-container/${CONTAINER}/system --delete-generations +2;
done
