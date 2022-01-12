#!/bin/bash
function display_ip_and_hosts(){
	while 
	
	
	echo "displays the IP addresses and symbolic names of all hosts in the current subnet"
}

function list_open_tcp(){
	echo "displays a list of open system TCP ports"
	for PORT in {20..1023}; do
	timeout 1 bash -c "</dev/tcp/192.168.171.128/$PORT &>/dev/null" && echo "port $PORT is open"
	done
}

fun_scan_port() {
	for PORT in {20..443}
	do
	  timeout 1 bash -c "</dev/tcp/$(($2))/$PORT &>/dev/null" 2>$?
	  [ $? -eq 0 ] && echo "port $PORT is open"
	done
}

function show_options(){
	echo "Choose from available parameters:"
		echo "--all - display the IP addresses and symbolic names of all hosts in the current subnet."
		echo "--target - display a list of open system TCP ports."
}

if [[ $# == 0 ]] 
	then 
		show_options
		exit 1 
elif [ "$1" == "--all" ]
	then 		display_ip_and_hosts
elif [ "$1" == "--target" ]
	then		fun_scan_port
else 
	echo "Invalid parameters"
	show_options
fi

