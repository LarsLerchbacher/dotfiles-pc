#!/bin/bash
playerctl metadata --follow --format '{{mpris:artUrl}}' | while read line; do
    echo "${line/file:\/\//}"
done
