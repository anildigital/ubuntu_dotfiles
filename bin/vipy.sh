#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: vipy <python module>" 
    exit 1
fi

MODULE_LOCATION=`python -c "import $1; print $1.__file__.rstrip('c')"`

if [ -z $MODULE_LOCATION ]; then
    echo "Couldn't find module: $1"
    exit 1
fi

vi $MODULE_LOCATION
