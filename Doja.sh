#! /bin/bash
# Doja.sh contents

helper=Doja-default
vers='1.0'
        cowsay "Moo?"
        read moo
	ymoo=$(echo $moo | grep -c "moo moo moo")
        if [ $ymoo -gt '0' ]; then
        cowsay "Moo, mooo, moo, mooo, moo, mooo, moo, moo"
        # go to doja
        cd /dev/doja
        # count the number of songs
        songs=$(ls -1 | wc -l)
        cowsay "there are $songs songs I know"
	# select a random number between 1 and nth number of songs 
        cowsay "number selection was $selection from the $songs songs I know"
	selection=$(shuf -i 1-$songs -n 1)
        # count the number of lines within the song
        linenum=$(cat songs/$selection.txt | wc -l )
        # select a random number between 1 and nth number of lines
	 numline=$(shuf -i 1-$linenum -n 1)
	echo line selection was $numline
        # print line
	
	lyrics=$(head -n $numline songs/$selection.txt | tail -4)
	title=$(head -n $selection songlist.txt | tail -1)
        text=$title:$lyrics
	echo $text | cowsay
	# exit
        exit
        elif [ $ymoo -eq '0' ]; then
        #ANGRY MOO!!
        cowsay "MOOoooVVEE!!!!" "I'm not in the mooOOOOooooodddd!!!"
        exit
        fi
