#!/bin/bash

NAZWA="plik.txt"
KATALOG="/home/jakub/data"
ROZMIAR="0"
OWNER="jakub"
ZAWARTOSC="tekst"
while [ "$WYBOR" != "7" ] ; do
    printf "\033c"
    echo
    echo "1.Nazwa pliku: $NAZWA"
    echo
    echo "2.Katalog:     $KATALOG"
    echo
    echo "3.Rozmiar:     $ROZMIAR"
    echo
    echo "4.Wlasciciel:  $OWNER"
    echo
    echo "5.Zawartosc:   $ZAWARTOSC"
    echo
    echo "6.Szukaj."
    echo
    echo "7.Koniec."
    echo

    read -p "Wybierz filtr od 1 do 7: " WYBOR

    case "$WYBOR" in
	"1") read -p"Wpisz nazwe pliku: " NAZWA ;;
	"2") read -p"Wpisz katalog startowy: " KATALOG ;;
	"3") read -p"Wpisz minimalny rozmiar " ROZMIAR ;;
	"4") read -p"Wpisz wlasciciela pliku: " OWNER ;;
	"5") read -p"Wpisz zawartosc pliku: " ZAWARTOSC  ;;
	"6") SZUKAJ="true" ;;
	"7")  ;;
	*) echo "Nie ma takiego filtru. Wybierz liczbe od 1 do 7"; WYBOR=0 ;;
    esac
    
    COMMAND="find"
    
    if [ "$SZUKAJ" = "true" ]
    then

	 if [ -n "$KATALOG" ]
	   then
	       COMMAND="$COMMAND $KATALOG"
	   else
	       COMMAND="$COMMAND /"
	   fi
	   
	   if [ -n "NAZWA" ]
	   then
	       COMMAND="$COMMAND -name $NAZWA"
	   fi
	   
	   if [ -n "$OWNER" ]
	   then
	       COMMAND="$COMMAND -user $OWNER"
	   fi
	   
	   if [ -n "$ROZMIAR" ]
	   then
	       COMMAND="$COMMAND -size +$ROZMIAR"
	   fi
	   
	   if [ -n "$ZAWARTOSC" ]
	   then
	       COMMAND="$COMMAND -exec grep -l \"$ZAWARTOSC\" {} \\;"
	   fi
	    COMMAND="$COMMAND | wc -l"

        FILE=$(eval $COMMAND);
#	echo $FILE
       if [ $FILE -gt 0 ]
       then
  	   echo "Znaleziono plik"
	   SZUKAJ="false"
#	   WYBOR=7
       else
	   echo "Nie znaleziono pliku."
	   SZUKAJ="false"
#	   WYBOR=7
       fi
       read C
    fi

done
