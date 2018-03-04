#!/bin/bash

INSTALLDIR=$1

if [[ "$INSTALLDIR" == "" ]]; then
    echo "
Kubernetes Helper Scripts

USAGE:

    $(basename $0) <dir>

DESCRIPTION:

    Remove an installation of the current version of this project.
    
    $(basename $0) is meant to be executed in the source directory of its
    current version. It looks into ./bin, list all files that were
    supposedly installed and removes them from <dir>. 

ARGUMENTS:

    dir: The directory where this version of the project was installed.
         Ex: /usr/local/bin

"
    exit 1
fi

FILESTOREMOVE=""
echo "The following files will be removed"
for f in $(find ./bin/ -mindepth 1 ); do
  echo "  $INSTALLDIR/$(basename $f)"
  FILESTOREMOVE="$FILESTOREMOVE $INSTALLDIR/$(basename $f)"
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

sudo rm -vfr $FILESTOREMOVE

echo "Uninstall completed"
