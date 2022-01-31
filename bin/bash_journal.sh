#!/bash/bin 


echo "Welcome to BASH Journal"

read text 

echo "entry stored."
# month=$(date -d @$EPOCHSECONDS +"%m");
# day=$(date -d @$EPOCHSECONDS +"%d");
calendar=$(date +%F)
clock=$(date +%T)


echo "" >> ./Address_Book/bin/bash_journal.txt
# echo  `date` $text | cat - bash_journal.txt > temp && mv temp bash_journal.txt

echo  $calendar $clock $text | cat - bash_journal.txt > temp && mv temp bash_journal.txt
# echo "_____________________________" >> bash_journal.txt

echo `clear`

cat bash_journal.txt
