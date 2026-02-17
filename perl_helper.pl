#Perl Helper Tool Suite
#Written by Daniel Ulman
#3/13/24
#Usage: perl perl_helper.pl

#!/bin/bash
#3/13/24 DCU
clear
while true; do

echo "==Option Menu=="
echo "1 - Cve List To Tutorial Converson"
echo "2 - Add Words To Wordlist"
echo "3 - Update CVS"

echo "e - exit"
echo "Enter your option"

read option
case $option in

  1)
    echo "Opening Form...";
    perl cvelist2tut.pl 
    ;;

  2)
    echo "Opening...";
    perl add_word.pl
    ;;

  3)
    echo "Updating CVS...";
    cvs update 
    ;;


  e)
    echo "Ok bye";
    exit 0;
    ;;

  *)
    echo "Enter valid option"
    ;;

esac
echo "Do you want to continue (Y/N)"
read opt;
echo $opt | grep -i 'y'

if [ $? -eq 0 ]
then
   clear
else
   exit 0
fi
done

