#!/bin/bash 
  qty=0 
  echo "Deal" while true; do 
  num=`<PROCESS_CHECK_COMMAND> | egrep 'TaskA|TaskB' | wc -l`; 
  if [ $num -lt 24 ] then if [ $qty -lt 99 ]; 
  then 
  uuid=$(sshpass -p <password> ssh -p <port> <username>@<ip> "bash /home/<userhome>/deal.sh | grep 'deal uuid:' | awk '{print \$3}'"); echo "$uuid"; 
  <Process_command> $uuid <data_file_path>; 
  current_time=$(date '+%Y-%m-%d %H:%M:%S'); 
  qty=$((qty + 1)); echo "Current count value: $qty at $current_time" else echo "DEAL EXIT $qty at $current_time" exit 0 fi fi sleep 2700; done
