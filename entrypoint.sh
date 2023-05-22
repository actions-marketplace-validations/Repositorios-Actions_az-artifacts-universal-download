#!/bin/sh -l

#Variables para JAVA
JAVA_HOME='/opt/jdk-13.0.1'
PATH="$JAVA_HOME/bin:$PATH"
export PATH

#Variables para MAVEN
M2_HOME='/opt/apache-maven-3.6.3'
PATH="$M2_HOME/bin:$PATH"
export PATH

az login -u $1 -p $2
az artifacts universal download --organization "$3" --project "$4" --scope project --feed "$5" --name "$6" --version $7 --path $8
$9
az logout
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT