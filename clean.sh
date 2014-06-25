#!/bin/bash

# clean sources and buildfiles from all packages

# clean with git
skipped=$(git clean -dXf)

# clean sub repositories
while read -r line; do
    line=${line//Skipping repository /}
    echo "Removing repository: $line"
    rm -rf $line
done <<< "$skipped"

# clean parent directories
git clean -dXf
