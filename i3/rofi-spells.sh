#!/bin/zsh

spells_location='/home/arius/lib/spells'
SPELL_SESSION=''

while true
do
    SPELL_SESSION=$(ls $spells_location | grep -e '\.sh$' | sed 's/\.sh//'|rofi -dmenu -p "Spell" -select $SPELL_SESSION)
    echo $SPELL_SESSION
    if [[ -z "${SPELL_SESSION}" ]]; then
	echo "Cancel"
	break
    else
	echo "sh $spells_location/$SPELL_SESSION.sh"
	zsh "$spells_location/$SPELL_SESSION.sh" &
    fi
done
