#!/bin/bash

# Define variables
discordsh_path="/var/discord/discord.sh"
webhook_url=""
monitor_url=""

# Read variables from arguments
json=$1
title=$2

# JSON
acknowledgement=$(echo "$json" | jq -r '.ack')
severity=$(echo "$json" | jq -r '.sev')
status=$(echo "$json" | jq -r '.status')
message=$(printf '%s' "$json" | jq '.msg')

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
        footer="none"
    fi

    # Check if status is problem or ok
    if [ "$status" = "OK" ]; then
        color="0x0FFF00"
    fi
fi

message=$(printf '%s' "$message" | sed 's/"//g')
$discordsh_path --webhook-url=$webhook_url --title "$title" --description "$message" --color $color --url $monitor_url --footer="Severity: $footer" --timestamp
