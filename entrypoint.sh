#!/bin/sh -l

echo "$1"
pwd
id
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT