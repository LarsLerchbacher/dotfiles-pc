#!/bin/bash
playerctl --follow metadata --format '{{status}} {{position}} {{mpris:length}}' | while read status position length; do
if [ $(playerctl metadata --format '{{status}}') = "Playing" ]; then
	python -c "print($position / $length * 100)"
    fi
done
