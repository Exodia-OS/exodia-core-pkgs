#!/bin/bash

#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS         #
#                                   #
#####################################

## Post-Installation Script For Exodia OS Executed by Calamare's `contextualprocess` module. ##

## ----------------------------------------------------------------------------------------- ##

# Dirs #
USER=`cat /etc/passwd | grep "/home" | cut -d: -f1 | head -1`
HOME_DIR="/home/${USER}"

# Remove Package #
_remove_pkg_if_installed() {

	pacman -Q "$1" &>/dev/null
	
	if [[ "$?" == 0 ]];
		
		then
			
			echo "[*] Removing package : $1"
			pacman -Rnscu --noconfirm ${1}

	fi

}

# Remove File  #
_remove_file_if_exist() {

	if [[ -e "$1" ]];
		
		then
			
			echo "[*] Deleting file/folder : $1"
			rm -rf ${1}

	fi

}

# Remove Files & Packages  #
_remove_for_wm() {

    for _pkg in "${_pkgs_to_remove[@]}";
		
		do

			_remove_pkg_if_installed ${_pkg}

		done

    for _file in "${_files_to_remove[@]}";
		
		do

			_remove_file_if_exist ${_file}

		done

}

# Remove Bspwm  #
remove_bspwm() {

	# List Of Packages To Remove #
	_pkgs_to_remove=('exodia-bspwm')
	_files_to_remove=("$HOME_DIR"/.config/bspwm)
	_remove_for_wm

}

# Remove DWM #
remove_dwm() {

	# List Of Packages To Remove #
	_pkgs_to_remove=(
		
		'exodia-dwm'
		'exodia-st' 
	)

	_remove_for_wm

}

# Remove i3  #
remove_i3() {

	# List Of Packages To Remove #
	_pkgs_to_remove=('exodia-i3wm')
	_files_to_remove=("$HOME_DIR"/.config/i3)
	_remove_for_wm

}

# Install Bspwm #
install_bspwm() {
	
	echo "[*] Installing Bspwm Window Manager..."
	remove_dwm
	remove_i3
}

## Install Everything ----------
install_everything() {

	echo -e "\n INSTALLING EVERYTHING! \n"

}

## ----------------------------------------------------------------------------------------- ##

# Execute In Target #
if [[ "$1" == '--bspwm' ]];
	
	then
		
		install_bspwm

elif [[ "$1" == '--everything' ]];
	
	then
		
		install_everything

fi
