#!/bin/bash

if [ "$1" = "force" ]
then
    flutter packages pub run build_runner build  --delete-conflicting-outputs
else
    flutter packages pub run build_runner build
fi
