#! /bin/bash

wms=( gnome kde xfce exit )

Install () { choise=$1
    script=$choise.sh
    
    if [ $choise == "exit" ]; then
        exit 0
    fi
    
    if test -f "$script"; then
        echo "OK --> $script"
        . ${script}
    fi
   
}

echo "Select a windows manager:"

select chose in "${wms[@]}"; do
    echo "You have chosen $chose"
    
    Install $chose 

    echo "Command not Found" 
    exit 0

done