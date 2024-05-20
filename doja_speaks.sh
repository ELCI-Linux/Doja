#! /bin/bash


# Detect user settings
source ~/.bashrc

  if [[ $reply_mode == *"text"* ]]; then
    # text handling logic
    if [ ${#reply} -lt 300 ]; then
    zenity --notification "$reply"
    else
    zenity --text "$reply"
    fi
  elif [[ $reply_mode == *"vocal"* ]]; then
  doja_say $vocal_settings $text
  elif [[ $reply_mode == *"combined"* ]]; then
  doja_print "$text" &&\
  doja_say "$text"
  fi
