#!/usr/bin/env bash
for CONTAINER in $(nixos-container list); do
    echo $CONTAINER;
    if [[ $(nixos-container status $CONTAINER) == "up" ]]; then
        WAS_RUNNING=1;
    else
        WAS_RUNNING=0;
        nixos-container start $CONTAINER;
    fi
    nixos-container run $CONTAINER -- nix-channel --add https://nixos.org/channels/nixos-20.03 nixos;
    nixos-container run $CONTAINER -- nix-channel --update;
    if [[ $WAS_RUNNING = "0" ]]; then
        nixos-container stop $CONTAINER;
    fi
    #NIX_PATH=nixpkgs=/nix/store/hwhrc541xw2r6mgy5v8qraxckm6zvqfa-nixos-20.09pre215752.9d0fac46fd0/nixos nixos-container update $CONTAINER;
    nixos-container update $CONTAINER;
    nix-env -p /nix/var/nix/profiles/per-container/${CONTAINER}/system --delete-generations +2;
done
