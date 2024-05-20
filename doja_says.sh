#! /bin/bash

# This script handles vocal responses.

  if [ ${advanced_vocal_handling_threshold} -eq 0 ]; then
  advanced_vocal_handling_threshold="300"
  fi

if [ ${#reply} -lt $advanced_vocal_handling_threshold ]; then
vocal_handling="off"
else
vocal_handling="on"
fi


# The following section is designed to serve the function or facilitating the partitioning of response.
# It is currently in a very rudimentary state.

# If vocal handling is off, the reply is simply passed to easyspeak using the users preferances.
if [[ $vocal_handling == *"off" ]]; then
  if [[ $vocal_engine == *"easyspeak"* ]]||[ ${#vocal_engine} -eq 0 ]; then
  easyspeak $easy_speak_string "$reply"
  fi
else
# Other wise the following logic is applied.
  source $doja_folder/settings/vocal.sha
        # IF easyspeak is the chosen vocal_engine or none has been selected (this is for error avoidance)....
        if [[ $vocal_engine == *"easyspeak"* ]]||[ ${#vocal_engine} -eq 0 ]; then
          until [ $doja_speaking == *"done"* ]]; do
          # This section explained: 'printf $reply' is piped to doja_says_more.sh for the following reasons.
          # - single lengthy response may impact the performance of any given TTS software
          # - doja_says_more.sh can help facilitate dynamic adjustments to the flags sent to a selected TTS system in a mode modular fashion.
          # - doja_says_more.sh interprets the response length and segments it accordingly. Each segment is then parsed to the chosen TTS sequentially.
          printf $reply | $doja_folder/doja_says_more.sh
          done
        fi


