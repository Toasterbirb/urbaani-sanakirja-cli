#!/bin/sh
word=$(echo $1 | sed 's/[åä]/a/g; s/ö/o/g')

# Download the website
site=$(curl -s https://urbaanisanakirja.com/word/$word/)

meaning=$(echo "$site" | grep "<p>" | sed 's/^[[:space:]]*//g; s/<p>/* /g; s/<\/p>//g; s/&quot;/"/g; s/&#39;/`/g; s/<br \/>-/\n  -/g; s/<br \/>//g')

[ -n "$meaning" ] && echo "$meaning" || echo "Ei tuloksia"
