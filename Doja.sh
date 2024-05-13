#! /bin/bash

	source ./bashrc

# Migrate this section to startup_redundancy.sh

	if [ ${#Doja_Folder} -eq 0 ]; then
	Doja_Folder="./Doja" &&\
	Doja_speak "No Doja Folder detected in bashrc, using default"
	else
	xcowsay "Doja Folder detected in bashrc"
	fi



# Migrate this section to chat_logic.sh
	
	if [[ $active_chat == "" ]]||[[ $chat_status == *"initated"* ]]; then
	Doja_speak "$Greeting"
	elif ([[ $active_chat != "" ]]&&[ ${#last_message} -gt 0]); then 
	Doja_speak "$last_message"
	fi
	


# Arming hotkey


	source $Doja_Folder/modules/hotkey.sh



	until [[ $status != *"Running"* ]]; do
	

	if [ $hotkey == *"Active"* ]; then
	
	# Use the session manager to determine the appropriate chat to use
	source $Doja_Folder/modules/session_manager.sh

	# Use the prompt window to receive user input
	source $Doja_Folder/modules/prompt_window.sh

	# Print prompt to 
	# Parse user input to auto-gpt
	response=$(bash $Doja_Folder/modules/prompt_processing.sh)

	# Print response to chat history
	echo "At $time Doja responded: $response" >> $Doja_Folder/history/$chat_ID
	

	hotkey="inactive"

	elif [[ $hotkey == *"suspend"* ]]; then
	status="shutdown" && exit
	else
	sleep 10s
	fi ||\	
	xcowsay "Sorry there was an error with Doja" && exit
	done 
