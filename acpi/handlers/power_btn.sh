#!/bin/bash
INPUT=/tmp/menu.sh.$$

# trap and delete temp files
trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

while true 
do

dialog --clear --help-button --backtitle "Power Button" \
	--title "[Power button pressed. What to do?]" \
	--menu "You can use the UP/DOWN arrow keys, the first \n\
	letter of the choice as a hot key, or the \n\
	number keys 1-9 to choose an option.\n\
	Choose the TASK" 15 50 4 \
	Poweroff "Shut down the pc" \
	Restart "Restart the pc" \
	Suspend "Suspend the pc (save to ram current session)" \
	Hibernate "Hibernate the pc (save to disk current session)" \
	Logout "Log out" \
	Cancel "Do not do anything" 2>"$(INPUT)"

menuitem=$(<"${INPUT}")

case $menuitem in 
	Poweroff) systemctl poweroff;;
	Restart) systemctl restart;;
	Suspend) echo -n mem >/sys/power/state ;;
	Hibernate) systemctl hibernate ;;
	Logout) logout ;;
	Cancel) exit 0;;
esac

done

[ -f $INPUT ] && rm $INPUT
