#!/bin/sh -l

echo "###                EXPORT JAVA_HOME             ###"
echo "###################################################"
JAVA_HOME='/opt/jdk-13.0.1'
PATH="$JAVA_HOME/bin:$PATH"
export PATH

echo "###                EXPORT M2_HOME               ###"
echo "###################################################"
M2_HOME='/opt/apache-maven-3.6.3'
PATH="$M2_HOME/bin:$PATH"
export PATH

echo "###                  AZ LOGIN                   ###"
echo "###################################################"
az login -u $1 -p $2

echo "###      AZ ARTIFACT UNIVERSAL DOWNLOAD         ###"
echo "###################################################"
az artifacts universal download --organization "$3" --project "$4" --scope project --feed "$5" --name "$6" --version $7 --path $8

echo "###               OPTIONAL COMMAND              ###"
echo "###################################################"
$9

echo "###                   AZ LOGOUT                  ###"
echo "###################################################"
az logout

time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT