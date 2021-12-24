#!/bin/bash
#displays a list of open system TCP ports
for PORT in {20..1023}; do
	if timeout 1 bash -c "</dev/tcp/10.42.0.16/$PORT"
 		then echo "port $PORT is open"
 	fi
done