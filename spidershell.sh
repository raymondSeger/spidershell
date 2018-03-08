#!/bin/bash

if [[ $1 == "" ]]; then
read -p "Site to spider: " site
fi
wget -q $site $1 -O - | tr "\t\r\n'" '   "' | grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' | sed -e 's/^.*"\([^"]\+\)".*$/\1/g'
