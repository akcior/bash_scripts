#!/bin/bash

NAZWA="szukajka.txt"
KATALOG="/home/linuxmint/data"
ROZMIAR="1"
OWNER="linuxmint"
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
	"4") read -p"Wpisz typ pliku: " TYP ;;
	"5") read -p"Wpisz zawartosc pliku: " ZAWARTOSC  ;;
	"6") SZUKAJ="true" ;;
	"7")  ;;
	*) echo "Nie ma takiego filtru. Wybierz liczbe od 1 do 7"; WYBOR=0 ;;
    esac
    
    if [ "$SZUKAJ" = "true" ]
    then
	FILE=$(find $KATALOG -name "$NAZWA" -user $OWNER -size $ROZMIAR -exec grep -l "$ZAWARTOSC" {} \; | wc -l)
	echo $FILE
       if [ $FILE -gt 0 ]
       then
  	   echo "Znaleziono plik"
	   WYBOR=7
       else
	   echo "Nie znaleziono pliku."
	   WYBOR=7
       fi
    fi

done
