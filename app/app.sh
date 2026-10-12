#!/bin/bash

command=$1
host=$2
port=$3


if ! [ -z "$command" ]
 then 
    
    if [ "$command" == "system-info" ]
     then 
  
        if [ -z "$host" ] && [ -z "$port" ] 
         then 

            echo "====================================================="
            echo "                System Information                   "
            echo "====================================================="


            # Displaying hostname
            echo "Hostname: $(hostname)"


            # Displaying current user
            echo "Current User: $(whoami)"


            # Displaying date and time
            echo "Date/Time: $(date)"

            # Displaying operating system
            echo "Operating System: $(grep '^PRETTY_NAME=' /etc/os-release | cut -d'"' -f2)"


            # Displaying kernel version
            echo "Kernel Version: $(uname -r)"

            # Displaying uptime
            echo "Uptime: $(uptime)"


            # Displaying CPU information
            echo "CPU Information: $(lscpu | grep -E 'Architecture|CPU\(s\):|Model name|Core\(s\) per socket|Thread\(s\) per core')"


            # Displaying memory information
            echo "Memory Information: $(free -h)"


            # Displaying current working directory
            echo "Current Working Directory: $(pwd)"


            echo "====================================================="
            echo "     System Information Check Completed.             "
            echo "====================================================="
        
        else 

            echo "devops-tool: error: Too many arguments provided. See 'devops-tool help'."
            
            exit 2



        fi 

    elif [ "$command" == "check-host"  ] 
     then 

        if [ -z "$host" ] 
         then 
         
             echo "devops-tool: error: Hostname is required. See 'devops-tool help'."

  
            exit 2

        fi
     
        
        if [ -z "$port" ]
         then 

            # Validation of hostname
            if  getent ahosts "$host" &>/dev/null
             then 

                echo "==============================================="
                echo "           Network Status Check                "
                echo "==============================================="

		        echo " Valid Hostname "
            
                echo " Hostname: "$host" "

		        echo " IP Address: $(getent ahosts "$host" | head -n 1 | awk '{ print $1}')"

                echo "==============================================="
                echo "           Network Check Completed             "
                echo "==============================================="
        
            else 

                echo " devops-tool: "$host" is not a valid host. See 'devops-tool help'."

                exit 2

            fi

        else 

            echo "devops-tool: error: Too many arguments provided. See 'devops-tool help'."

            exit 2
        fi 



    elif [ "$command" == "check-port"  ]
     then
        
        if [ -z "$host" ] 
         then 

            echo "devops-tool: error: Hostname is required. See 'devops-tool help'."

            exit 2
        else
            
            
            if [ -z "$port" ]
             then

                echo "devops-tool: error: Port is required. See 'devops-tool help'."
                
                exit 2

            else

                    echo "==============================================="
                    echo "           Network Status Check                 "
                    echo "==============================================="


               if [[ "$port" =~ ^[0-9]+$ ]] && [ "$port" -ge 1 ] && [ "$port" -le 65535 ] 
		        then 


                    
                    echo " Valid Port Number"
           

                    echo " Checking TCP Port Connection for "$host" on Port "$port"... "

            
                    # Checking if the port is accepting Connection
                    if nc -zv "$host" "$port" &>/dev/null
                     then
                        echo " TCP Connection Successful "
                    

                        echo "==============================================="
                        echo "           Network Check Completed             "
                        echo "==============================================="
                    else
                        echo " TCP Connection Failed "

                        echo "==============================================="
                        echo "           Network Check Completed             "
                        echo "==============================================="
                        exit 1

                    fi
                
            
                else

                    echo "Invalid port number"

                    echo "==============================================="
                    echo "           Network Check Completed             "
                    echo "==============================================="
                
                    exit 2

                fi

            fi 
           
                   
        
            


        fi

     elif [ "$command" == "help" ]
     then

        if [ -z "$host" ] && [ -z "$port" ]
         then

            echo "====================================================="
            echo "                    Help Menu                      "
            echo "====================================================="

            echo "NAME"
            echo ""          
            echo " devops-tool - the powerful checker"
        
            echo ""
            echo ""
            echo " devops-tool is a fast, scalable and powerful CLI tool used to check linux system, network and disk information"

            echo ""

            echo " USAGE "
            echo ""

            echo "devops-tool system-info "
            echo "devops-tool check-host <host> "
            echo "devops-tool check-port <host> <port> "
            echo "devops-tool help "
            echo ""
        
            echo " devops-tool [COMMAND]  "
            echo ""

            echo " for system and help no option is required"
            echo ""

            echo " devops-tool [COMMAND] [PORT] "
            echo ""

            echo " for network port is required with internet connection"
            echo ""

            echo "COMMANDS"
            echo ""

            echo " system -  Display useful Linux system information "
            echo " check-host - Resolve/Check a host  "
            echo " check-port - Validate the port and check TCP connectivity. "
            echo " help - Display commands and usage "

            echo ""

        
            echo "====================================================="
            echo "                    Completed                       "
            echo "====================================================="

        else 

            echo " devops-tool: error: Too many arguments provided. See 'devops-tool help'."

            exit 2

        fi


    
  


         

           
            

    else

        echo " devops-tool: '$command' is not a valid command. See 'devops-tool help'."

        exit 2

    fi





    

else 

    echo " devops-tool: No command specified. See 'devops-tool help' for valid devops-tool commands ."

 exit 2
fi

