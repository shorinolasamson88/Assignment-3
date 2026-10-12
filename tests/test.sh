#!/bin/bash

failure=0 

if ./app/app.sh help &> /dev/null
 then

    echo " [PASSED]: ./app/app.sh help is a valid command"

else 

    echo " [FAILED]: ./app/app.sh help is an invalid command"
    failure=$(( failure + 1))

fi 

if ./app/app.sh system-info &> /dev/null
 then

    echo " [PASSED]: ./app/app.sh system-info is a valid command"

else 

    echo " [FAILED]: ./app/app.sh system-info is an invalid command"
    failure=$(( failure + 1))

fi 

./app/app.sh network &> /dev/null
status=$?

if [ "$status" -eq 2 ]
 then
    
    echo " [PASSED]: ./app/app.sh network is an invalid command"
   
else 

    echo " [FAILED]: ./app/app.sh network is an invalid command"
    failure=$(( failure + 1))

fi 

./app/app.sh check-host &> /dev/null
status=$?

if [ "$status" -eq 2 ]
 then

    echo " [PASSED]: ./app/app.sh check-host has a missing host parameter"
   
else 

    echo " [FAILED]: ./app/app.sh check-host has a host parameter"
    failure=$(( failure + 1))

fi

./app/app.sh check-host google.com &> /dev/null
status=$?

if [ "$status" -eq 0 ]
 then

    echo " [PASSED]: ./app/app.sh check-host google.com is a valid host parameter"

else

    echo " [FAILED]: ./app/app.sh check-host google.com is an invalid host parameter"
    failure=$(( failure + 1))

fi

./app/app.sh check-port google.com &> /dev/null
status=$?

if [ "$status" -eq 2 ]
 then
    echo " [PASSED]: ./app/app.sh check-port google.com has a missing port parameter"
  

else

    echo " [FAILED]: ./app/app.sh check-port google.com has a port parameter"
    failure=$(( failure + 1 ))
fi

./app/app.sh check-port google.com abc &> /dev/null
status=$?

if [ "$status" -eq 2 ]
 then

    echo " [PASSED]: ./app/app.sh check-port google.com abc is a non numeric port parameter"

else 

    echo " [FAILED]: ./app/app.sh check-port google.com abc is a numeric port parameter"
    failure=$(( failure + 1 ))
    
fi

./app/app.sh check-port google.com 70000 &> /dev/null
status=$?

if [ "$status" -eq 2 ]
 then 
    echo " [PASSED]: ./app/app.sh check-port google.com 70000 is an out of range port parameter"
   

else 
    echo " [FAILED]: ./app/app.sh check-port google.com 70000 is within the range port parameter"
    failure=$(( failure + 1 ))

fi

./app/app.sh check-port google.com 443 &> /dev/null
status=$?

if [ "$status" -eq 0 ]
 then 

    echo " [PASSED]: ./app/app.sh check-port google.com 443 is a valid port parameter"

else 

    echo " [FAILED]: ./app/app.sh check-port google.com 443 is an invalid port parameter"
    failure=$(( failure + 1 ))

fi 



if [ "$failure" -eq 0 ]
 then

    echo " All tests passed"
    exit 0

else

    echo " $failure test failed "
    exit 1

fi 
 