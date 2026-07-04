#!/bin/bash

output_devices() {
    devices=()
    while IFS= read -r line; do
        mac=$(echo "$line" | awk '{print $2}')
        name=$(echo "$line" | awk '{$1=$2=""; print $0}' | xargs)
        devices+=("{\"name\": \"$name\", \"mac\": \"$mac\"}")
    done < <(bluetoothctl devices Connected)
    
    echo "[$(IFS=,; echo "${devices[*]}")]"
}

output_devices

bluetoothctl --monitor | while read -r line; do
    output_devices
done
