#!/bin/sh -l

echo "## HOME"
echo "###################################################################"
pwd

echo "## AZ LOGIN"
echo "###################################################################"
az login -u $1 -p $2

echo "## CREATE DIRECTORY $6"
echo "###################################################################"
mkdir $6
ls -l

echo "## AZ ARTIFACT UNIVERSAL DOWNLOAD"
echo "###################################################################"
cd $6 && az artifacts universal download --organization "$3" --project "$4" --scope "$5" --feed "$6" --name "$7" --version $8 --path $9
ls -l

echo "## AZ LOGOUT"
echo "###################################################################"
az logout

# Copy files in runner
#docker cp 7be60b0e9652:api-sample-anthony .

# Delete image in runner
#docker rmi 7be60b0e9652

time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT