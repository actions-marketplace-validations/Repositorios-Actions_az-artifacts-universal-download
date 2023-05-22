#!/bin/sh -l

az login -u $1 -p $2
az artifacts universal download --organization "$3" --project "$4" --scope project --feed "$5" --name "$6" --version $7 --path $8
$9
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT