#!/bin/bash

INPUT=("plik.txt" "/home/jakub/data" "200" "jakub" "tekst")
ZENEX=0
IFS=','
COMMAND="find"
while [ $ZENEX  = "0" ] ; do
    INPUT=($(zenity --forms --title="SZUKAJKA" \
		    --text="Wprowadz dane pliku." \
		    --separator=',' \
		    --add-entry="Nazwa Pliku:" \
		    --add-entry="Katalog:" \
		    --add-entry="Minimalny Rozmiar:" \
		    --add-entry="Wlasciciel:" \
		    --add-entry="Zawartosc:"))
    ZENEX=$?
    
    if [ $ZENEX = "0" ]
    then
	   if [ -n "${INPUT[1]}" ]
	   then
	       COMMAND="$COMMAND ${INPUT[1]}"
	   else
	       COMMAND="$COMMAND /"
	   fi
	   
	   if [ -n "${INPUT[0]}" ]
	   then
	       COMMAND="$COMMAND -name ${INPUT[0]}"
	   fi
	   
	   if [ -n "${INPUT[3]}" ]
	   then
	       COMMAND="$COMMAND -user ${INPUT[3]}"
	   fi
	   
	   if [ -n "${INPUT[2]}" ]
	   then
	       COMMAND="$COMMAND -size +${INPUT[2]}"
	   fi
	   
	   if [ -n "${INPUT[4]}" ]
	   then
	       COMMAND="$COMMAND -exec grep -l \"${INPUT[4]}\" {} \\;"
	   fi

	   
	   COMMAND="$COMMAND | wc -l"
	   echo "$COMMAND"
	   FILE=$(eval $COMMAND);
	   
	   if [ $FILE -gt 0 ]
	   then
	       echo "Znaleziono plik"
	       zenity --info --text="Znaleniono szukany plik."
	   else
	       echo "Nie znaleziono pliku."
	       zenity --info --text="Nie znaleziono szukanego pliku."
	   fi
    fi

done

#find ${INPUT[1]} -name "${INPUT[0]}" -user ${INPUT[3]}  -size ${INPUT[2]} -exec grep -l "${INPUT[4]}" {} \; | wc -l
