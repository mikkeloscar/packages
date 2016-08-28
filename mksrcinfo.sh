#!/bin/bash

for pkg in *; do
    if [ -d "${pkg}" ]; then
        echo "Updating .SRCINFO for $pkg"
        cd ${pkg}
        mksrcinfo
        # strip line with creation date
        gawk -i inplace 'NR != 2' .SRCINFO
        cd ..
    fi
done
