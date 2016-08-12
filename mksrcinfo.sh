#!/bin/bash

for pkg in *; do
    if [ -d "${pkg}" ]; then
        echo "Updating .SRCINFO for $pkg"
        cd ${pkg}
        mksrcinfo
        cd ..
    fi
done
