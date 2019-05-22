#!/bin/bash

# Define variables
discordsh_path="/discord.sh/discord.sh"
webhook_url=""
monitor_url=""

# Read variables from arguments
acknowledgement=$1
severity=$2
status=$3
title=$4
message=$5

# Check if ack
if [ "$acknowledgement" = "yes" ]; then
    color="0xFFFFFF"
    title="Problem Acknowledgement"
else
    # Check severity status
    if [ "$severity" = "0" ]; then
        color="0x24DDFF"
        footer="Not classified"
    elif [ "$severity" = "1" ]; then
        color="0x2481FF"
        footer="Information"
    elif [ "$severity" = "2" ]; then
        color="0xFFF224"
        footer="Warning"
    elif [ "$severity" = "3" ]; then
        color="0xFFC024"
        footer="Average"
    elif [ "$severity" = "4" ]; then
        color="0xFF5B24"
        footer="High"
    elif [ "$severity" = "5" ]; then
        color="0xFF2917"
        footer="Disaster"
    else
        color="0xFFFFFF"
        footer="-"
    fi

    # Check if status is problem or ok
    if [ "$status" = "OK" ]; then
        color="0x0FFF00"
    fi
fi


$discordsh_path --webhook-url=$webhook_url \
  --title "$title" \
  --description "$message" \
  --color "$color" \
  --url "$monitor_url" \
  --footer "Severity: $footer" \
  --timestamp
