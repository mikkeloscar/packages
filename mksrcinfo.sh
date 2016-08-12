#!/bin/bash

for pkg in *; do
    if [ -d "${pkg}" ]; then
        echo "Updating .SRCINFO for $pkg"
        cd ${pkg}
        makepkg --printsrcinfo > .SRCINFO
        cd ..
    fi
done
