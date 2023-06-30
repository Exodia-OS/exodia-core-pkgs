#!/bin/bash

#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS         #
#                                   #
#####################################

## Fix Calamares Autologin ##

## ----------------------- ##

# Dirs #
DM_FILE='/etc/sddm.conf'

enable_autologin() {

	_session_name="$1"

	if [[ `cat $DM_FILE | grep 'Autologin'` ]];

		then

			sed -i -e "s/Session=.*/Session=$_session_name/g" "$DM_FILE"

	fi

}

## ----------------------- ##

# Execute In Target #
if [[ "$1" == '--bspwm' ]];

	then
		
		enable_autologin 'bspwm'


elif [[ "$1" == '--everything' ]];
	
	then
		
		enable_autologin 'bspwm'

fi
