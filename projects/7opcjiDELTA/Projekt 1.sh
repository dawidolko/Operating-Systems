#!/usr/bin/bash

logo_funkcji() {
    clear

    echo "FUNKCJA KWADRATOWA"

    sleep 1

}

function exit_for_bad_input {
    bad_input="$1"
    shift
    message="$@"
    echo "Blad: $message, wiadomosc odebrana: '$bad_input'"
    uzytkownik_wartosci
    exit 1
}

function validate_input {
    to_validate="$1"
    if ! [[ $to_validate =~ ^-?[0-9999999]+(\.[0-9999999]+)?$ ]]; then
        exit_for_bad_input "$to_validate" "Nie ma takiej cyfry"
    fi
    if [[ $A = 0 ]]; then
        exit_for_bad_input "$A" "Zero nie jest dozwolone, poniewaz wtedy a=0 z racji tego ze nie bedzie to rownanie kwadratowe"
    fi
}

uzytkownik_wartosci(){
    echo -n "Podaj wartosc A: "
    read A
    echo -n "Podaj wartosc B: "
    read B
    echo -n "Podaj wartosc C: "
    read C

    for val in "$A" "$B" "$C"; do
        validate_input "$val"
    done
    echo "Wartosci sa zgodne"
    DELTA=$(echo "$B*$B-4*$A*$C" | bc -l)
    PIERW=`echo "scale=5 ; sqrt($DELTA)" | bc`
    CZYZERO=`echo "$DELTA==0" | bc`
    CZYWIEKSZE=`echo "$DELTA>0" | bc`
    echo "Delta wynosi: $DELTA , jej pierwiastek to: $PIERW"

    if [ "$CZYZERO" = 1 ]; then
        P0=`echo "scale=5 ;(-1*$B)/(2*$A)" | bc`
        echo "Rownanie posiada jeden pierwiastek: $P0"
    elif [ "$CZYWIEKSZE" = 1 ]; then
        P1=`echo "scale=5 ;(-1*$B-$PIERW)/(2*$A)" | bc`
        P2=`echo "scale=5 ;(-1*$B+$PIERW)/(2*$A)" | bc`
        echo "Rownanie posiada dwa pierwiastki: $P1 i $P2"
    else
        echo "To rownanie nie posiada pierwiastkow"
    fi
    }

logo_funkcji
uzytkownik_wartosci