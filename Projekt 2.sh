# !/bin/bash 

#Skrypt opiera sie na menu, w ktorym mamy pięć wyborów.
#Mozemy wybrac miedzy kalkulatorem, liczeniem sredniej, liczeniem pól z obwodami, twierdzeniem pitagorasa oraz liczeniem delty z miejscami zerowymi
#Praktycznie kazda liczba ktora mamy wprowadzic zostaje poddana sprawdzeniu, czy faktycznie nia jest (a nie znakiem np. #, z, -)


#Wybieram z menu program ktorego chce uzywac
echo ""
echo "Wybierz program:"
echo "-----------"
echo "1. Kalkulator"
echo "2. Liczenie sredniej"
echo "3. Pola i obwody"
echo "4. Twierdzenie Pitagorasa"
echo "5. Obliczanie delty oraz miejsc zerowych"
echo "6. Wyjscie"
echo "-----------"
re='^[0-9]+$'
read program

#Jesli $program to "Kalkulator" (1)
if [ "$program" == "1" ] ; 
then

	echo ""
	echo "Wybierz typ dzialania:"
	echo "-----------"
	echo "1. Dodawanie"
	echo "2. Odejmowanie"
	echo "3. Mnozenie"
	echo "4. Dzielenie"
	echo "-----------"
	echo ""
	re='^[0-9]+$'
	read ch  
	if ! [[ $ch =~ $re ]] ; then
		echo "Niepoprawny znak" >&2; exit 1
	else
		echo "Podaj a: "
		re='^[0-9]+$'
		read a 
			if ! [[ $a =~ $re ]] ; then
				echo "Niepoprawny znak" >&2; exit 1
			else
				echo ""
				echo "Podaj b: "
				re='^[0-9]+$'
				read b 
					if ! [[ $b =~ $re ]] ; then
						echo "Niepoprawny znak" >&2; exit 1
					else
						echo ""

						case $ch in
						  1)res=`echo $a + $b | bc` 
						  ;; 
						  2)res=`echo $a - $b | bc` 
						  ;; 
						  3)res=`echo $a \* $b | bc` 
						  ;; 
						  4)res=`echo "scale=2; $a / $b" | bc` 
						  ;; 
						*) echo "Niepoprawny znak"
						esac
						echo "Wynik: $res"					
					fi
			fi
	fi
	
#Jesli $program to "Liczenie sredniej" (2)
elif [ "$program" == "2" ] ;
then
	echo "Podaj ilosc liczb:"
	re='^[0-9]+$'
	read ilosc  
		#Sprawdzam czy podana wielkosc jest liczba
		if ! [[ $ilosc =~ $re ]] ; then
   			echo "Niepoprawny znak" >&2; exit 1
   		else
   			echo ""
			i=1           
			sum=0        
			echo "Podaj liczby"
			
			while [ $i -le $ilosc ]
			do
			  read liczby

			sum=$((sum + liczby))
			i=$((i + 1))
			done
			
			avg=$(echo "scale=2; $sum / $ilosc" | bc -l)

			   echo "Srednia tych liczb wynosi: " $avg 
		fi
		
#Jesli $program to "Pola i obwody" (3)
elif [ "$program" == "3" ] ;
then
	echo ""
	echo "Wybierz figure:"
	echo "-----------"
	echo "1. Kwadrat"
	echo "2. Prostokat"
	echo "3. Trojkat"
	echo "4. Romb"
	echo "5. Rownoleglobok"
	echo "6. Okrag"
	echo "-----------"
	re='^[0-9]+$'
	read figura
		#sprawdzanie czy liczba
		if ! [[ $figura =~ $re ]] ; then
			echo "Niepoprawny wybor..." >&2; exit 1
		else
			#kwadrat
			if [ "$figura" == "1" ] ;
			then
				echo ""
				echo "  a   "
				echo "------"
				echo "|    | a"
				echo "|    |"
				echo "------"
				echo ""
				echo "Wzor na pole: a*a"
				echo "Wzor na obwod: 4a"
				echo ""
				echo "Podaj bok kwadratu"
				re='^[0-9]+$'
				read kwadrat
					#sprawdzanie czy liczba
					if ! [[ $kwadrat =~ $re ]] ; then
						echo "Niepoprawny znak..." >&2; exit 1
					else
						echo ""
						obwodKwadratu=$((kwadrat * 4))
						poleKwadratu=$((kwadrat * kwadrat))
						echo "Obwod kwadratu = " $obwodKwadratu
						echo "Pole kwadratu = " $poleKwadratu
					fi
			#prostokat
			elif [ "$figura" == "2" ] ;
			then
				echo ""
				echo "     a     "
				echo "-----------"
				echo "|         | b"
				echo "|         |"
				echo "-----------"
				echo ""
				echo "Wzor na pole: a*b"
				echo "Wzor na obwod: 2a+2b"
				echo ""
				echo "Podaj bok a prostokatu"
				re='^[0-9]+$'
				read prostokatA
				echo ""
					#sprawdzanie czy liczba
					if ! [[ $prostokatA =~ $re ]] ; then
						echo "Niepoprawny znak..." >&2; exit 1
					else
						echo "Podaj bok b prostokatu"
						read prostokatB
						if ! [[ $prostokatB =~ $re ]] ; then
							echo "Niepoprawny znak..." >&2; exit 
						else
							obwodProstokata=$((prostokatA * 2 + prostokatB * 2))
							poleProstokata=$((prostokatA * prostokatB))
							echo "Obwod prostokatu =" $obwodProstokata
							echo "Pole prostokata =" $poleProstokata
						fi
					fi

			elif [ "$figura" == "3" ] ;
			then
				#menu trojkatow
				echo ""
				echo "Podaj typ trojkata"
				echo "1. Trojkat"
				echo "2. Trojkat rownoboczny"
				echo "3. Wyjscie"
				
		 		#trojkat
		 		re='^[0-9]+$'
				read trojkat
				echo ""
				if [ "$trojkat" == "1" ] ;
				then
					echo ""
					echo "    /\    "
					echo "   /| \   "
					echo "  / |h \  "
					echo " /__|_ _\ "
					echo "    a      "
					echo ""
					echo "Wzor na pole: P=a*h/2"
					echo ""
					echo "Podaj wysokosc trojkata"
					re='^[0-9]+$'
					read trojkatPierwszyH
						if ! [[ $trojkatPierwszyH =~ $re ]] ; then
							echo "Niepoprawny znak..." >&2; exit 1
						else
							echo ""
							echo "Podaj bok a"
							read trojkatPierwszyA
							
							if ! [[ $trojkatPierwszyA =~ $re ]] ; then
								echo "Niepoprawny znak..." >&2; exit 1
							else
								goraTrojkat=$((trojkatPierwszyA * trojkatPierwszyH))
								poleTrojkatPierwszy=$(($goraTrojkat / 2))
								echo "Pole trojkata: " $poleTrojkatPierwszy
							fi
						fi

				
				#trojkat rownoboczny
				elif [ "$trojkat" == "2" ] ;
				then
					echo ""
					echo "   /\   "
					echo "a /  \ a"
					echo " /____\ "
					echo "    a   "
					echo ""
					echo "Wzor na pole: P = a*a * sqrt(3)"
					echo "Wzor na wysokosc: h = a * sqrt(3) / 2"
					echo ""
					echo "Podaj bok trojkata"
					echo ""
					re='^[0-9]+$'
					read poletrojkataA
						if ! [[ $poletrojkataA =~ $re ]] ; then
							echo "Niepoprawny znak..." >&2; exit 1
						else
							pierwtrzech=2
							poleTrojkatRownoboczny=$((poletrojkataA*poletrojkataA*pierwtrzech))
							poleTrojkatRownobocznyPierwszy=$((poleTrojkatRownoboczny / 4))
							echo "Pole trojkata = ~"$poleTrojkatRownobocznyPierwszy
						fi
				elif [ "$trojkat" == "3" ] ;
				then
					echo ""
					echo "Wylaczanie programu..."
					echo ""
				else
					echo "Niepoprawny wybor"
				fi
		
				#romb	
			elif [ "$figura" == "4" ] ;
			then
				echo ""
				echo "    /|\        "
				echo "   / | \       "
				echo "  /  |f \      "
				echo " /___|___\     "
				echo " \ e |   /     "
				echo "  \  |  /      "
				echo "   \ | /       "
				echo "    \|/        "
				echo ""
				echo "Wzor na pole: P = e*f / 2"
				echo ""
				echo "Podaj e: "
				read e
					if ! [[ $e =~ $re ]] ; then
						echo "Niepoprawny znak..." >&2; exit 1
					else
						echo ""
						echo "Podaj f: "
						read f
						echo ""
						if ! [[ $f =~ $re ]] ; then
							echo "Niepoprawny znak..." >&2; exit 1
						else
							poleRombu=$((e*f))
							poleRombuDwa=$(($poleRombu / 2))
							echo "Pole rombu =" $poleRombuDwa
						fi
					fi
				
			#rownoleglobok
			elif [ "$figura" == "5" ] ;
			then
				echo "            a         "
				echo "     ______________   "
				echo "    /|            /   "
				echo " b / |           /    "
				echo "  /  |h         / b   "
				echo " /___|_________/      "
				echo "        a             " 
				echo ""
				echo "Wzor na pole: P = a*h"
				echo ""
				echo "Podaj a"
				read rownolA
					if ! [[ $rownolA =~ $re ]] ; then
						echo "Niepoprawny znak..." >&2; exit 1
					else
						echo ""
						echo "Podaj h"
						read rownolH
						if ! [[ $rownolH =~ $re ]] ; then
							echo "Niepoprawny znak..." >&2; exit 1
						else
							echo ""
							poleRownolegloboku=$((rownolA * rownolH))
							echo "Pole rownolegloboku = " $poleRownolegloboku
						fi
					fi
			
			#okrag
			elif [ "$figura" == "6" ] ;
			then
				echo ""
				echo "Wzor na pole okregu: P = pi * r*r"
				echo "Wzor na obwod okregu : L = 2*pi*r "
				echo ""
				echo "Podaj promien"
				read promien
					if ! [[ $promien =~ $re ]] ; then
						echo "Niepoprawny znak..." >&2; exit 1
					else
						poleOkregu=$(($promien*$promien * 4))
						obwodOkregu=$((8*$promien))
						echo "Pole okregu = ~"$poleOkregu
						echo "Obwod okregu = ~"$obwodOkregu
					fi
						
			else
				echo "Niepoprawny znak..."
				
			fi
		fi
		
#Jesli $program to "Twierdzenie pitagorasa" (4)
elif [ "$program" == "4" ] ;
then
	echo ""
	echo "Wersja dla dwoch znanych przyprostokatnych"
	echo "(Ewentualnie mozna w myslach zamienic znaki"
	echo "i dzieki temu obliczyc jedna z przyprostokatnych"
	echo "tzn. B*B = -A*A + C*C)"
	echo ""
	echo "  |\     "
	echo "  | \    "
	echo "a |  \ c "
	echo "  |   \  "
	echo "  |____\ "
	echo "     b   "
	echo ""
	echo "Uzywamy twierdzenia pitagorasa:"
	echo "a*a + b*b = c*c"
	echo ""
	echo "Podaj a: "
	re='^[0-9]+$'
	read A
		if ! [[ $A =~ $re ]] ; then
			echo "Niepoprawny znak..." >&2; exit 1
		else
			echo "Podaj b: "
			read B
			if ! [[ $B =~ $re ]] ; then
				echo "Niepoprawny znak..." >&2; exit 1
			else
				Bpierw=$(($B**2))
				Apierw=$(($A**2))
				Cpierw=$(($B+$A))
				Wyjscie=$(echo "scale=2;sqrt($Cpierw)"|bc)
				echo "A = $A"
				echo "B = $B"
				echo "C = $Wyjscie"
			fi
		fi

	
#Jesli $program to "Obliczanie delty oraz miejsc zerowych" (5)	
elif [ "$program" == "5" ] ;
then
	echo ""
	echo "Obliczanie delty oraz miejsc zerowych"
	echo ""
	echo "Wzor na delte: delta = sqrt(b*b - 4*a*c)"
	echo ""
	
    echo -n "Podaj A: "
    read A
    echo -n "Podaj B: "
    read B
    echo -n "Podaj C: "
    read C
    if ! [[ $A =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Podana wartosc nie jest cyfra"
    exit
    fi
    if ! [[ $B =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Podana wartosc nie jest cyfra"
    exit
    fi 
    if ! [[ $C =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Podana wartosc nie jest cyfra"
    exit
    fi
    DELTA=$(echo "$B*$B-4*$A*$C" | bc -l)
    PIERW=`echo "scale=5 ; sqrt($DELTA)" | bc`
    CZYZERO=`echo "$DELTA==0" | bc`
    CZYWIEKSZE=`echo "$DELTA>0" | bc`
    echo "Delta wynosi: $DELTA , jej pierwiastek to: $PIERW"

    if [ "$CZYZERO" = 1 ]; then
        P0=`echo "scale5 ;(-1*$B)/(2*$A)" | bc`
        echo "Rownanie posiada jeden pierwiastek: $P0"
    elif [ "$CZYWIEKSZE" = 1 ]; then
        P1=`echo "scale=5 ;(-1*$B-$PIERW)/(2*$A)" | bc`
        P2=`echo "scale=5 ;(-1*$B+$PIERW)/(2*$A)" | bc`
        echo "Rozwnanie posiada dwa pierwiastki: $P1 i $P2"
    else
        echo "To rownanie nie posiada pierwiastkow"
    fi

#Jesli $program to "Wyjscie" (6)	
elif [ "$program" == "6" ] ;
then
	echo ""
	echo "Wylaczanie programu..."		
	echo ""		
	

#Jesli $program wczytal niewlasciwy wybor (7,a,^,$...)
else
	echo "Nieprawidlowy wybor..."
fi