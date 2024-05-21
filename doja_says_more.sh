#! /bin/bash




# This script has two functions:
# 1) Reading responses and segmenting them appropriately for use with TT
# 2) Parsing the segmented responses to the chosen TTS sequentially.
# 3) Facilitating the stopping of above sequence
# 4) (IN THE FUTURE) Restarting the TTS sequence



# Function to segment the reply based on punctuation and store them in variables
segment_reply() {
  local reply="$1"
  local segment_idx=1
  while IFS= read -r segment; do
    # Check if the segment is empty
    if [[ -n "$segment" ]]; then
      printf -- '%s="%s"\n' "reply_part_$segment_idx" "$segment"
      ((segment_idx++))
    fi
  done <<< "$reply"
}

# Main program
reply="$1"
easy_speak_settings="$2"

# Segment the reply into parts
segment_reply "$reply"

# Loop through reply_part variables and call easyspeak
until [ -z "${!reply_part@}" ]; do
  segment_name="${!reply_part@}"
  segment_value="${!reply_part@}"
  echo "Calling easyspeak with segment: $segment_value and settings: $easyspeak_settings"
  easyspeak $easyspeak_settings "${!reply_part@}"
  unset "$segment_name"
done
