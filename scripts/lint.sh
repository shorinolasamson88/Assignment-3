#!/bin/bash

failure=0


if [ -f ./README.md ]
 then
    
    echo " README.md file exists"

else

    echo " README.md file does not exist"
    failure=$(( failure + 1 ))

fi

if [ -d ./app ]
then 

    echo "app directory exists"

else

    echo "app directory does not exist"
    failure=$(( failure + 1 ))

fi

if [ -f ./app/app.sh ]
then 

    echo "app.sh file exists"
   

else

    echo "app.sh file does not exist"
    failure=$(( failure + 1 ))

fi

if [ -d ./scripts ]
then

    echo "scripts directory exists"

else

    echo "scripts directory does not exist"
    failure=$(( failure + 1 ))

fi

if [ -f ./scripts/lint.sh ]
then 

    echo "lint.sh file exists"

else

    echo "lint.sh file does not exist"
    failure=$(( failure + 1 ))

fi

if [ -f ./scripts/build.sh ]
then

    echo "build.sh file exists"

else

    echo "build.sh file does not exist"
    failure=$(( failure + 1 ))

fi

if [ -d ./tests ]
then 

    echo "tests directory exists"

else

    echo "tests directory does not exist"
    failure=$(( failure + 1 ))

fi

if [ -f ./tests/test.sh ]
then 

    echo "test.sh file exists"

else

    echo "test.sh file does not exist"
    failure=$(( failure + 1 ))

fi

if [ -d ./.github ]
then 

    echo ".github directory exists"

else

    echo ".github directory does not exist" 
    failure=$(( failure + 1 ))

fi

if [ -d ./.github/workflows ]
 then
    
    echo ".github/workflows directory exists"

else 

    echo ".github/workflows directory does not exist"
     failure=$(( failure + 1 ))

fi

if [ -f ./.github/workflows/ci.yml ]
then 

    echo "ci.yml file exists"

else 

    echo "ci.yml file does not exist"
     failure=$(( failure + 1 ))

fi

if [ -f ./Dockerfile ]
 then 
 
    echo "Dockerfile exists"

else 

    echo "Dockerfile does not exist"
     failure=$(( failure + 1 ))

fi

if [ -f ./compose.yaml ]
 then
    
    echo "compose.yaml file exists"

else 

    echo "compose.yaml file does not exist"
     failure=$(( failure + 1 ))

fi

if [ -f ./.dockerignore ]
 then
    
    echo ".dockerignore file exists"

else

    echo ".dockerignore file does not exist"
     failure=$(( failure + 1 ))
    
fi

if [ -f ./grade.sh ]
 then

    echo "grade.sh file exists"

else 

    echo "grade.sh file does not exist"
     failure=$(( failure + 1 ))

fi

if bash -n ./app/app.sh 
 then

    echo "app.sh syntax is correct"

else 

    echo "app.sh syntax is incorrect"
     failure=$(( failure + 1 ))

fi

if bash -n ./scripts/lint.sh
 then

    echo "lint.sh syntax is correct"

else 

    echo "lint.sh syntax is incorrect"
    failure=$(( failure + 1 ))

fi    

if bash -n ./scripts/build.sh
 then

    echo "build.sh syntax is correct"

else 

    echo "build.sh syntax is incorrect"
     failure=$(( failure + 1 ))

fi

if bash -n ./tests/test.sh
 then

    echo "test.sh syntax is correct"

else 

    echo "test.sh syntax is incorrect"
     failure=$(( failure + 1 ))

fi


if bash -n ./grade.sh
 then

    echo "grade.sh syntax is correct"

else 

    echo "grade.sh syntax is incorrect"
     failure=$(( failure + 1 ))

fi

if [ "$failure" -gt 0 ]
then 


    echo "Linting failed: $failure check(s) failed." 
    exit 1 

else 

    echo "Linting passed: No issues found." 
    exit 0

fi