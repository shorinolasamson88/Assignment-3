#!/bin/bash

failure=0

docker build -t devops-tool . &> /dev/null
status=$?
if [ "$status" -eq 0 ]
 then 
    echo "devops-tool image built successfully"

else
    echo " devops-tool image fail to build"
    failure=$(( failure + 1 ))
    exit 1
fi

docker run --rm devops-tool help &> /dev/null
status=$?
if [ "$status" -eq 0 ]
 then 
    echo "devops-tool help dislays the help menu"

else
    echo "devops-tool help fail to dislay the help menu"
    failure=$(( failure + 1 ))

fi


docker run --rm devops-tool system-info &> /dev/null
status=$?
if [ "$status" -eq 0 ]
 then 
    echo "devops-tool system-info dislays the system information"

else
    echo "devops-tool system-info fail to display the system information"
    failure=$(( failure + 1 ))

fi



docker run --rm devops-tool invalid-command &> /dev/null
status=$?
if [ "$status" -eq 2 ]
 then 
    echo "devops-tool invalid-command failed due to invalid command"

else
    echo "devops-tool invalid-command passed due to invalid command"
    failure=$(( failure + 1 ))

fi

if [ "$failure" -eq 0 ]
 then

    echo " Image build and smoke tests done successfully"
    exit 0

else

    echo " $failure test(s) failed"
    exit 1

fi