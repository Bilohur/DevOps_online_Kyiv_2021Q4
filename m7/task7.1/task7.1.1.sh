#!/bin/bash
function display_ip_and_hosts1(){
	echo "displays the IP addresses and symbolic names of all hosts in the current subnet"
netw="192.168.171"
for i in $(seq 1 254)
do {
	# -4 - use ipv4 only 
	# -c -Stop after sending count ECHO_REQUEST packet
	# -t ttl, ping only. Set the IP Time to Live.
  ping -4 -c1 -t1  $netw.$i 2>&1 &&
  echo $netw.$i $(host "$netw.$i" | awk '{print $5}')
}
done
}

function display_ip_and_hosts(){
	netw="192.168.171"
	ping 192.168.171.128 -W 1 -c 1
	echo $?
	for i in $(seq 255);
	do
	 	ping -W 1 -c 1 192.168.171.$i 
		if [[ "$?" -eq 1 ]]
			then echo ping successful
		fi	 	
	done



}

function display_ip_and_hosts_nmap(){
	netw="192.168.171"
	ping 192.168.171.128 -W 1 -c 1
	echo $?
	for i in $(seq 255);
	do
	 	ping -W 1 -c 1 192.168.171.$i 
		if [[ "$?" -eq 1 ]]
			then echo ping successful
		fi	 	
	done

}


function list_open_tcp(){
	for PORT in {20..1024}; do
	  timeout 1 bash -c "</dev/tcp/127.0.0.1/$PORT" &>/dev/null &&  echo "port $PORT is open"
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
	then 		
		display_ip_and_hosts
elif [ "$1" == "--target" ]q
	then		
		list_open_tcp
else 
	echo "Invalid parameters"
	show_options
fi

