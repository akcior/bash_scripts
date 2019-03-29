#!/bin/bash

INPUT=("plik.txt" "/home/jakub/data" "200" "jakub" "tekst")
ZENEX=0
IFS=','
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
	   FILE=$(find ${INPUT[1]} -name "${INPUT[0]}" -user ${INPUT[3]}  -size ${INPUT[2]} -exec grep -l "${INPUT[4]}" {} \; | wc -l);
	   
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


