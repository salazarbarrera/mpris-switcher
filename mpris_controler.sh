#!/bin/bash
command=$1
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

if $(test -f  $SCRIPTPATH/current) ; then
	if dbus-send --print-reply --dest=$(cat $SCRIPTPATH/current) /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.$command ; then
		echo "Command $command succeeded"
	else
		echo "Command $command failed. Trying default."
		if dbus-send --print-reply --dest=$(python $SCRIPTPATH/list_dbus_mpris.py --one) /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.$command  ; then
		    echo $(python $SCRIPTPATH/list_dbus_mpris.py --one) > $SCRIPTPATH/current
		else
		    rm $SCRIPTPATH/current
		fi
	fi
else
	if dbus-send --print-reply --dest=$(python $SCRIPTPATH/list_dbus_mpris.py --one) /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.$command  ; then
		echo $(python $SCRIPTPATH/list_dbus_mpris.py --one) > $SCRIPTPATH/current
	fi
fi
