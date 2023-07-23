
#!/bin/bash

#set -x

#fetching word from external API
word=$(curl -s https://random-word-api.herokuapp.com/word | tr -d '"[]')
#uncomment the line below to make it easier to test the program
#echo $word

#word length check
length=${#word}

#initialization of the variable for the guessed word, where not yet guessed letters are replaced with '-'
guessed_word=`echo -n "$word" | sed 's/./-/g'`

#set the number of chances
chances=7
#variable initialization for already guessed letters
guessed_letters=''

#print the guessed word, where all letters are replaced with '-', however, it informs about the number of characters
echo "Guessed word: $guessed_word"

#loop that executes until our chance of guessing the word drops to 0 and the word has not just been guessed
while [ $chances -gt 0 ] && [ $guessed_word != $word ]
do
  #reading a letter from the keyboard from the user, however, the letters should be entered one at a time and the password cannot be guessed right away, only if we already know what the word is, enter its letters one at a time
  read -p "Enter the letter: " letter

  #checking whether the letter we provided has not already been checked
  if [[ $guessed_letters == *"$letter"* ]]; then
    echo "You've already given these letters"
  else
    #checking if the given letter is in the word
    if [[ $word == *"$letter"* ]]; then
      #a loop that finds the position of a letter in a word, of course if it is in it
      for (( i=0; i<$length; i++ ))
      do
        #getting the letter in position i, to be able to check later if it is the same as the letter we typed
        char=${word:i:1}

        if [ "$letter" == "$char" ]; then
          #replacing '-' with a given letter in the place where it is in the guessed word
          guessed_word=${guessed_word:0:i}$letter${guessed_word:i+1}
        fi
      done
    else

      #reducing the chance by 1 in case of a wrong letter
      chances=$((chances-1))
      if [ $chances -eq 7 ]; then
echo "
_______
|/ |
|
|
|
|
|

"
elif [ $chances -eq 6 ]; then
echo "
_______
|/ |
| O
|
|
|
|

"
elif [ $chances -eq 5 ]; then
echo "
_______
|/ |
| O
| |
|
|
|

"
elif [ $chances -eq 4 ]; then
echo "
_______
|/ |
| O
| /|
|
|
|

"
elif [ $chances -eq 3 ]; then
echo "
_______
|/ |
| O
| /|\\
|
|
|

"
elif [ $chances -eq 2 ]; then
echo "
_______
|/ |
| O
| /|\\
| /
|
|

"
elif [ $chances -eq 1 ]; then
echo "
_______
|/ |
| O
| /|\\
| / \\
|
|

"
elif [ $chances -eq 0 ]; then
echo "
_______
|/ |
| X
| /|\\
| / \\
|
|

"
fi
echo "Wrong letter, $chances left "
    fi
  fi
  #adding a letter to those already guessed
  guessed_letters=$guessed_letters$letter

  echo "Guessed word: $guessed_word"

done

#check if the number of chances is equal to 0
if [ $chances -eq 0 ]; then
  #writing a message about losing due to lack of chances or about winning if we guess the word
    echo "You lost! The guessed word is: $word"
else
  echo "Win! You guessed the word: $word"
fi
