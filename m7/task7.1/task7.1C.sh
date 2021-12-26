#!/bin/bash

# C. Create a data backup script that takes the following data as parameters:
# 1. Path to the syncing directory.
# 2. The path to the directory where the copies of the files will be stored.
# In case of adding new or deleting old files,
 # the script must add a corresponding entry to the log file indicating the time, 
 # type of operation and file name. [The command to run the script must be added to crontab with a run frequency of one minute]
function show_options(){
	echo "Specify: path to the syncing directory;"
	echo "         path to the directory where the copies of the files will be stored"
}

function put_to_cron(){
	echo "Script will work every 1 minute"
}

	#check if only 2 arguments present
if [[ $# != 3 ]] 
	then 
		echo "Invalid parameters"
		show_options
		exit 1 
fi

#check all arguments for being dirs
for i in "$@"
do
	if [ -d $i ]
		then
		echo "$i is a directory "		
	else
		echo "Invalid parameters"
		show_options
		exit	
	fi
done

if ! command -v rsync &> /dev/null
then
    echo "rsync could not be found, installing"
    sudo apt-get update
    sudo apt-get install rsync
fi
echo "sync_dirs"
echo "$1 $2"
# rsync -azvh $1 $2


# [ -d "$1" ] || show_options exit 0
# [ -d "$1" ] || show_options exit 0
# [ $# == 2 ] || show_options exit 0
# echo "dir1: $1"
# echo "dir2: $2"