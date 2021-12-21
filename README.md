# Doja
This is the public repository for the Doja application.

**What is Doja?**
Similar to fortune, Doja is a random line generator which outputs Dojacat lyrics. Doja can easily be modified to act as a smart and discrete password manager.
To launch Doja enter

    Doja
    
You will then be greeted by 'Doja' who will only ask you one question "Moo?"


#  ______
# < Moo? >
#  ------
#        \   ^__^
#         \  (oo)\_______
#            (__)\       )\/\
#                ||----w |
#                ||     ||


If you enter 'Doja' a response she doesn't like, you are told off!
 
 Output:
 _______________________________
/ MOOoooVVEE!!!! I'm not in the \
\ mooOOOOooooodddd!!!           /
 -------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||


However if you give 'Doja' a response she does like, e.g. ... 
    
     Doja
     moo moo moo
     
 ... she will give you a positive output.
(The example below shows Doja's default output - random DojaCat lyrics.)
 
output:
#_________________________________________
#/ Kiss Me More:All on my tongue, I want   \
#| it (la-la-la-la) Boy, you write your    |
#| name, I can do the same Ooh, I love the |
#| taste, la-la-la-la-la All on my tongue, |
#\ I want it                               /
# -----------------------------------------
#        \   ^__^
#         \  (oo)\_______
#            (__)\       )\/\
#                ||----w |
#                ||     ||

 
Doja works by accessing a specific .sh file (/dev/Doja.sh) which runs the default behaviour for Doja.
You can modify this behaviour by modifying the if statements within Doja.sh - these are all written in basic shell.

