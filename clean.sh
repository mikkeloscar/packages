#!/bin/bash

# clean sources and buildfiles from all packages

# clean with git
git clean -dXf

skipped=$(git clean -dXf)

# clean sub repositories
while read -r line; do
    line=${line//Skipping repository /}
    if [ "$line" != "" ]; then
        echo "Removing repository: $line"
        rm -rf $line
    fi
done <<< "$skipped"

# clean parent directories
git clean -dXf
