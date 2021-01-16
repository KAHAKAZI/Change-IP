#!/bin/bash

echo "Change ip address"

newip='22.22.00.00'
pattern='ip'
file=`ls | grep ip.xml`

address=$( cat "$file" | sed '/(?:[0-9]{1,3}\.){3}[0-9]{1,3}/p')

#address="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< cat "$file")"

#address=$(grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' "$file_content")

#address=$( cat "$file" | grep `^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$` )

#address=$(cat "$file" | grep http | sed '/\^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/p' )

#address="$( cat $file | grep 8080 )"

#address=$(awk '/(?:[0-9]{1,3}\.){3}[0-9]{1,3}/{print $0}' $file)

for f in $(ls | grep $pattern);
do
	echo BEFORE
	cat $f
	address=$( cat $f | grep http | cut -d '/' -f 3 | cut -d ':' -f 1 )
	sed -i "s/$address/$newip/g" $f

	echo ADDRESS
	#cat $address
	echo $address
	#cat $file_content

	echo AFTER
	cat $file

done
