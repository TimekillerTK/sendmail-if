#!/bin/bash

# Path of directory to check
PATH="/path/to/folder"

# Find the number of lines
wcl=$(/bin/find "$PATH" -type f -mtime -7 | /bin/wc -l)

# E-mail address of the sender
sender="sender@email.com"

# Name of the sender
sendername="Synology Test"

# Destination mail
receiver="receiver@mail.com"

# If number of lines is equal to zero, send mail. Indents are important for heredoc
if [ $wcl -eq 0 ]; then
    /sbin/sendmail -F $sendername -f $sender -t $receiver <<-EOF
        Subject: Synology Mail Test
        Seems to work. Hooray. Meow.
    EOF
fi