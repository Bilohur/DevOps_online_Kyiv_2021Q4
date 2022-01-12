#!/bin/bash

# 1. From which ip were the most requests?


# 2. What is the most requested page?

# 3. How many requests were there from each ip?

# 4. What non-existent pages were clients referred to?

# 5. What time did site get the most requests?

# 6. What search bots have accessed the site? (UA + IP)

function request_per_ip() {
    declare -A ip_array
    while read line; do
        ip=$(echo $line | awk '{print $1}')
        if [[ -v ip_array[$ip] ]]; then
            ip_array[$ip]=$((ip_array[$ip]+1))
        else
            ip_array[$ip]=1
        fi
    done < $LOG_FILE

    for ip in ${!ip_array[@]}; do echo ${ip_array[$ip]} $ip; done | sort -rn | head -10
}

request_per_ip