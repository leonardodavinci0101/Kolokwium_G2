#!/usr/bin/env bash
# Kolokwium — plik do samodzielnego uzupełnienia.
# Uruchomienie: bash src/analiza.sh dane
# Wynik: nazwa.log;liczba_ERROR;STATUS

# TODO 1: katalog z argumentu albo domyślnie 'dane'.
# TODO 2: if -d; błąd 
# na stderr i exit 2. TODO 3: for po *.log; uwzględnij katalog bez plików .log
# TODO 4: grep i liczenie wierszy ERROR dla każdego pliku. 
# TODO 5: if wyznaczający STATUS zgodnie z ZADANIA.md.
# TODO 6: printf trzy pola oddzielone średnikami.
#!/bin/bash


katalog=${1:-dane}

if [ ! -d "$katalog" ]; then
    echo "Nie istnieje taki katalog" >&2
    exit 2
fi
for plik in "$katalog"/*.log; do
    if [ -f "$plik" ]; then
        bledy=$(grep -c '^ERROR;' "$plik")
        warn=$(grep -c '^WARN;' "$plik")

        if [ "$TIMEOUT" -ge 2 ]; then
            status="ALARM"
        else
            status="OK"
        fi

        echo "${plik##*/};$bledy;$status"
    fi
done
