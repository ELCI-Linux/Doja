#! /bin/bash

#This script is used to control the chosen Doja assistants printed responses via xcowsay


source ~/.bashrc

# ADD REDUNDANCY 

if [ ${#doja_orientation} -eq 0 ]; then
doja_orientaton=""
fi

if [ ${#doja_size} -eq 0 ]; then
doja_size="small"
fi


if [ ${#doja_avatar} -eq 0 ]; then
doja_avatar_string=""
else
doja_avatar_string='--image="$doja_avatar"'
fi

if [ ${#doja_at} -eq 0 ]; then
doja_at_string=""
else
doja_at_string='--at="$doja_at"'
fi

if [ ${#doja_bubble_at} -eq 0 ]; then
doja_bubble_at_string=""
else
doja_bubble_at_string='--bubble-at="$doja_bubble_at"'
fi

if [[ $doja_avatar_tw == *"active"* ]]; then
doja_avatar_tw_string=""
else
doja_avatar_tw_string="--no-wrap"
fi

# Understanding the following command:
xcowsay $doja_orientation --cow-size="$doja_size" $doja_avatar_string $doja_at_string $dpja_bubble_at_string $doja_avatar_tw_string $reply
# doja_orientation will determine whether the text bubble is displayed to the left or right of the avatar
# doja_size will determine the size of the avatar
# doja_avatar string modifies the command to display a specific avatar instead of text
# doja_at determines where doja will appear on screen
# doja_bubble_at determines the relative position of the text bubble
# doja_avatar_tw controls text wrapping.
