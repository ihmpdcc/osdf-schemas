#!/bin/bash

# Make a tarball for deployment to a working OSDF server. Simply drop the
# .tar.gz into the <OSDF>/working/namespaces directory, and untar.

# Ensure we have the latest code from the repository
git pull

# Get the last revision so we can make a versioned tarball
REVISION=$(git log --abbrev-commit --pretty=oneline | sed -e "s:\x1B\[[0-9;]*[mK]::g" | awk '{print $1}' | head -n 1)

# Create the tar file
tar -zcv --exclude='.git' --exclude='.gitignore' -f ihmp-$REVISION.tar.gz ihmp 
