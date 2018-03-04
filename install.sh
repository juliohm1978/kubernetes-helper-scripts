#!/bin/bash

INSTALLDIR=$1

if [[ "$INSTALLDIR" == "" ]]; then
    echo "
Kubernetes Helper Scripts

USAGE:

    $(basename $0) <dir>

DESCRIPTION:

    Installs the current version of this project.
    
    $(basename $0) is meant to be executed in the source directory of its
    current version. It copies all files from ./bin into <dir> and
    sets permission to execute for all users.

ARGUMENTS:

    dir: The directory where this version of the project should be installed.
         Ex: /usr/local/bin

"
    exit 1
fi

echo
echo "The following files will be installed"
for f in $(find ./bin/ -mindepth 1 ); do
  echo "  $INSTALLDIR/$(basename $f)"
done

echo
if [[ "$SKIP_CONFIRMATION" != "true" ]]; then
    while true; do
        read -p "Continue (y/n)?" yn
        case $yn in
            [Yy]* ) echo " "; break;;
            [Nn]* ) exit 0;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

chmod +x bin/*
sudo cp -vr bin/* /usr/local/bin/

echo
echo "Installation completed"
