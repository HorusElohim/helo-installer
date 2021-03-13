#! /bin/bash

# ZENITY PLAYGROUND

# Select date
#date=$(zenity --calendar)
#echo "Date: $date"

# Entry text
#text=$(zenity --entry --title "Name request" --text "Please enter your name:")
#echo "Text: $text"

# File input
#in_filepath=$(zenity --file-selection --multiple --filename "${HOME}/")
#echo "File path: $in_filepath"

# File output
#filepath_out=$(zenity --file-selection --save --confirm-overwrite --filename "${HOME}/")
#echo "File path: $filepath_out"

# Progress bar 
#
# Dummy script to demonstrate the zenity progress widget!

(
  echo 25
  echo "# Setting up..."
  sleep 0.1

  echo 30
  echo "# Reading files..."
  sleep 0.1

  echo 70
  echo "# Creating content..."
  sleep 0.2

  echo 100
  echo "# Done!"
) | zenity --title "Progress bar example" --progress --auto-kill


# Notification
### INFO
# zenity --info --width=400 --height=200 --text "This is a notification!"
### WARNING
# zenity --warning --width=400 --height=200 --text "This is a warning!"
## QUESTION
#answer=$(zenity --question --text "Are you sure you want to quit?" --no-wrap --ok-label "Yes" --cancel-label "No")
#if [ $? -eq 0 ]; then echo "Answer: Yes"; else echo "Answer: No"; fi
 
# Password
#passw=$(zenity --password --width=400 --height=200 --text "Password query!")
#echo "Passw: $passw"

# List
#zenity --list --column Selection --column Distribution FALSE Debian TRUE Fedora 
#!/bin/sh

list=$(zenity --list \
  --title="Choose the Bugs You Wish to View" \
  --column="Install" --column="Id" --column="Severity" --column="Description" \
    1 id_1 Normal "GtkTreeView crashes on multiple selections" \
    2 id_2 High "GNOME Dictionary does not handle proxy" \
    3 id_3 Critical "Menu editing does not work in GNOME 2.0" \
  --checklist)
echo "Selection: $list"
    
