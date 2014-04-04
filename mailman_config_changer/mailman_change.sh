#!/bin/bash

PTH=`pwd`
MAILINGLISTS="${PTH}/mailinglists.txt"
CONFIG="${PTH}/config.conf"
BACKUP_PATH="/tmp/lists_configs/"
ERROR=0

if [ ! "$USER" = "mailman" ] ; then
	echo "you are not mailman" 1>&2
	exit 1
fi

if [ ! -r "$CONFIG" ] ; then
	echo "config file \"${CONFIG}\" not readable" 1>&2
	ERROR=1
fi
if [ ! -r "$MAILINGLISTS" ] ; then
	echo "file \"${MAILINGLISTS}\" not readable" 1>&2
	ERROR=1
fi

if [ $ERROR -eq 1 ] ; then
	exit 2
fi

mkdir -p "$BACKUP_PATH"
cd /usr/lib/mailman

while read LIST
do
	# backup
	bin/config_list -o "${BACKUP_PATH}${LIST}.conf" "$LIST"
	# reconfigure
	bin/config_list -i "$CONFIG" "$LIST"
done < "$MAILINGLISTS"
