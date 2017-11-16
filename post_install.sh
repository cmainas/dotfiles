#/bin/bash

## Some actions after installation of a apt distro
YES=

if [ "$1" = "-y" ]; then
	shift
	YES=1
fi

STEP () {
	if [ -z "$YES" ]; then
		read -p 'Do it? (Y/n) ' c
		[ -z "$c" ] || [ "$c" = "Y" ] || [ "$c" = "y" ]
	else
		true
	fi
}

set -v
cd ${HOME}

i3=0;
STEP Install git, vim, and other tools && {
	apt-get install git vim bash-completion build-essential
}

STEP Install latex, xelatex && {
	apt-get install latex xelatex
	i3=1
}

STEP Install i3wm, i3blocks && {
	apt-get install i3 i3blocks
	i3=1
}

STEP Enable greek UTF-8 locale && {
	sed -i -e 's/^# *\(el_GR.UTF-8\)$/\1/g' /etc/locale.gen
	locale-gen
}

STEP Enable greek UTF-8 typing in shell && {
	touch ~/.bashrc
	sed -i -e '/^export LC_CTYPE=/d' ~/.bashrc
	echo 'export LC_CTYPE=el_GR.UTF-8' '>>' ~/.bashrc
	# Now you have to re-login to enable it
}

STEP Get config files && {
	git clone https://github.com/xmrancho/dotfiles
	if [ -z $i3 ]; then
		rm -r .i3
	fi
}

