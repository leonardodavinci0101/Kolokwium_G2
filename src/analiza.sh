#!/usr/bin/env bash
# Kolokwium — plik do samodzielnego uzupełnienia.
# Uruchomienie: bash src/analiza.sh dane
# Wynik: nazwa.log;liczba_ERROR;STATUS

# TODO 1: katalog z argumentu albo domyślnie 'dane'.
KATALOG="${1:-dane}"
# TODO 2: if -d; błąd na stderr i exit 2.
if [[ -d "$KATALOG" ]]; then
    echo "Katalog istnieje: $KATALOG"
else
    echo "Brak katalogu" >&2
    exit 2
fi
# TODO 3: for po *.log; uwzględnij katalog bez plików .log.
for PLIK in "$KATALOG"/*.log; do
    [[ -f "$PLIK" ]] || continue
# TODO 4: grep i liczenie wierszy ERROR dla każdego pliku.
ILE=$(grep -c '^ERROR' "$PLIK")
    if [[ "$ILE" -gt 0 ]]; then
        STATUS="ALARM"
    else
        STATUS="OK"
    fi
# TODO 5: if wyznaczający STATUS zgodnie z ZADANIA.md.

# TODO 6: printf trzy pola oddzielone średnikami.
printf '%s;%s;%s\n' "$PLIK" "$ILE" "$STATUS"
done 
