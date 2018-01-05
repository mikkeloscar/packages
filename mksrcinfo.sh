#!/bin/bash

pwd=$(dirname "$(realpath $0)")

for pkg in $pwd/*; do
    if [ -d "${pkg}" ]; then
        echo "Updating .SRCINFO for ${pkg#$pwd/}"
        cd ${pkg}
        makepkg --printsrcinfo > .SRCINFO
        # strip line with creation date
        gawk -i inplace 'NR != 2' .SRCINFO
        cd ..
    fi
done
