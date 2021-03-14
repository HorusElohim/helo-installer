# License to referee directly to the person relative at this Account HorusElohim@gmail.com
#    ALL Copyrights Reserved To HorusElohim@gmail.com TM2021

# Log Access
date="`date +"%Y-%m-%d"`"
clock="`date +"%R"`"


say () { what=$1
  echo -e "$what"
  spd-say -r 1 -w -p -82  -p -88 -o espeak-ng "$what"
}

say_slow () { what=$1
  echo -e "$what"
  spd-say -r -100 -w -p -82  -p -88 -o espeak-ng "$what"
}

tell () { what=$1
  echo -e "$what"
  spd-say -r 1 -p -82  -p -88 -o espeak-ng "$what"
}


# repeater
_repeater () { multiplier=$1 ; character=$2
  echo -e "$(for i in {0..$multiplier}; do echo -n $character; done )"
}

# tab
_tab () { multiplier=$1
 _repeater $multiplier "\t"
}

# welcome windows size
_helo_welcome_window_size () {
  W=240
  H=80
  echo "--width=$W --height=$H"
}

# welcome windows size
_helo_main_menu_window_size () {
  W=1200
  H=800
  echo "--width=$W --height=$H"
}

# welcome windows size
_helo_console_result_size () { title=$1
  W=600
  H=800
  echo "--title $title --width=$W --height=$H"
}

###############
#   Welcome   #
###############
Welcome() {
  speak "Welcome to The ZSHelo Installer Version 3.3.3"
  zenity `_helo_welcome_window_size` --info --text "`_tab 1`Welcome\n\n`_tab 2`To The ZSHelo Installer!\n\n`_tab 3`v3.3.3"
  speak "ZHelo-Installer has Started!"
}


########################
#   SelectRootFolder   #
########################
SelectRootFolder(){ _root_path=$1
  # shellcheck disable=SC2046
  # shellcheck disable=SC2005
  echo -e `zenity --file-selection --directory --filename $_root_path`
}


###################
#   LoadScripts   #
###################
LoadScript(){
  # To-DO path selectable
  find $(SelectRootFolder "../") -name "*.sh"
  }


_clean_script_path () { list_path=$1
  ./test_awk.sh

}

TEST_interpreter_load_script () { output_data_cache=$1
  all_script_path=$(LoadScript)

  for record in $all_script_path; do
    echo -e $record >> "script_data_cache.data"
  done

}

#################
#   MainMenu    #
#################
MainMenu() { zenity_list_sh=$1

  Welcome

  selected_from_list=$(./$zenity_list_sh)

  echo "Selection: $selected_from_list"
}



# Intro Joke
merci_egpytian_pyramide () { multiplier=$1
pyramid_block="[01]"
pyramid_layer= `say "$(for i in {0..$multiplier}; do echo -n $pyramid_block $(_tab $i) $pyramid_block; done )"`
say "$(for i in {0..$multiplier}; do say "`_tab $i` $pyramid_block `_tab $i` $pyramid_block" ; done )"
# TO-DO FIX THIS xD
}