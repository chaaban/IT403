#!/usr/bin/bash

# Getting the list of interfaces available using the -D 
interfaces=$(tshark -D)

# Checking if the interfaces string is zero, then exit
if [ -z $interfaces ] 
    then 
        echo "There are no interfaces available."
        echo $?
        exit 1
    fi

# Print all available interfaces
echo "Available interfaces"
for interface in $interfaces;
do
    echo "$interface"
done

# Prompt the user for the interface he want to use
read -p "Enter the interface name: " user_Interface

# Check if the input is a number
if [ "$user_Interface" != "${interfaces[*]}" ]
    then  
        echo "There is no such interface. Please choose one from the list provided."
        echo $?
        exit 2
fi

echo "Now the following input will filter the network traffic that will be displayed"

# Getting the port number if any
read -p "Enter the port number: " port

# Checking if the port is a valid port number
if [ $port != ^[0-9]{1,4}$ ]
    then    
        echo "port number is not valid"
        port=""
fi

# Getting the specified protocol if any
read -p "Enter the protocol" protocol

# Checking if the protocol is a valid protocol
valid_protocols=("HTTPS" "HTTP" "DNS" "ICMP" "TCP" "UDP" "SSH")

if [ "$protocol" != "${valid_protocols[*]}" ]
    then    
        echo "protocol not valid."
        protocol=""
fi

# Getting the number of packages the user want to display
read -p "The number of packages: " pkg_count

# Checking if the input is valid
if [ "$pkg_count" != ^[0-9]+$ ]
    then    
        echo "Invalid! You  must enter a number."
        pkg_count=20
fi

# Checking if the user wants to see real time traffic
if [ $pkg_count -eq 0 && -z "$port"]
    then    
        output=$(tshark -i $user_interface -w "./traffic.pcap")
    elif [ -z "$port" ]
        output=$(tshark -i $user_interface -w "./traffic.pcap" -c$pkg_count -Y $protocol)
    else
        output=$(tshark -i $user_interface -w "./traffic.pcap" -c$pkg_count -Y "port $port" $protocol)
fi

# Dsiplaying the output
for line in $output;
do
    echo "$line"
done
exit 0


