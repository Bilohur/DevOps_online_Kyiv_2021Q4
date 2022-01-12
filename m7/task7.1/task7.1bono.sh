fun_scan_port() {
	for PORT in {20..443}
	do
	  timeout 1 bash -c "</dev/tcp/$(($2))/$PORT &>/dev/null" 2>$?
	  [ $? -eq 0 ] && echo "port $PORT is open !"
	done
}	
if [[ "$1" = --target && -z "$2" ]];
then
	fun_scan_port
fi