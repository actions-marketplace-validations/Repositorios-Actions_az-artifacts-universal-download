#!/bin/sh -l

"$1"
pwd
id
az
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT