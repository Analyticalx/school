#!/bin/bash
while true
do
    echo "checking docker...."
    dockerd=$(ps aux | grep dockerd | wc -l)
    if [ "$dockerd" -eq "2" ] 
    then
        run=$(sudo docker ps | wc -l)
        if [ "$run" -eq "2" ] 
        then
            echo "container started"
        else
            echo "container stating"
            sudo docker run -p 50070:50070 -p 8088:8088 -p 5000:5000 -p 2222:22 -d analyticalx/hadoop-into
        fi
    else
        echo "service docker starting"
    fi

    sleep 10
done