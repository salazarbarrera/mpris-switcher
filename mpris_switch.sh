#!/bin/bash
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
option=$(zenity --list --title "MPRIS Selector" --text "Seleccione reproductor" --column="0" $(python $SCRIPTPATH/list_dbus_mpris.py --zenity) --hide-header --width 400)

if [ ! -z "$option" || $option equals "(null)"] ; then
  echo $option > $SCRIPTPATH/current
fi
