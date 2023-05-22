#!/bin/sh -l

az login -u $1 -p $2
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT