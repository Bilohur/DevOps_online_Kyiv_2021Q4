#!/bin/bash
function display_ip_and_hosts(){
	echo "displays the IP addresses and symbolic names of all hosts in the current subnet"
}

function list_open_tcp(){
	echo "-- displays a list of open system TCP ports"
	for PORT in {20..1023}; do
	timeout 1 bash -c "</dev/tcp/10.42.0.16/$PORT &>/dev/null" && echo "port $PORT is open"
	done
}

if [[ $# == 0 ]] 
	then 
		echo "You have to give at least one parameter."
		exit 1 
elif [ "$1" == "--all" ]
	then
		display_ip_and_hosts
elif [ "$1" == "--target" ]
	then
		list_open_tcp
else 
	echo "Invalid parameters"
fi

