#!bin/bash

# echos what ever text you put after echo

echo Hello cruel, World

# echos, prints three arguments passed after script without quotes

echo $1
echo $2
echo $3

#no spaces when assigning variables

foo=3 

echo $foo

# or if you want to have spaces at the point of assignment
# use the nested paranthesis syntax

(( bar = 6 ))

echo $bar 

#unset drops assignment 

unset bar 
echo $bar  

#this won't print anything

#you can reassign variable valutes
#to the values of other variables.

wildcard=69 

foo=$wildcard 

echo $foo

 # wrong:
 foo=x y z # sets foo to x; will try to execute y on z

 # right:
 foo="x y z" # sets foo to "x y z"

 echo $foo

 #ever variable is an array 

foo_array[0]="one"
foo_array[1]="two"
foo_array[2]="three"
foo_array[3]="Sunshine, brother!"

echo ${foo_array[1]}
echo ${foo_array[3]}
# prints nothing
echo ${foo_array[4]}

#copies array
bar_array=(${foo_array[@]})
#copy splits string with break
echo ${bar_array[3]}
echo ${bar_array[4]}

list=("a 1" "b 2", "c 3")
echo 'Here is a list/array I assigned like this list=("a 1" "b 2", "c 3")'
echo 'and then I printed them like so: echo ${list[*]} and echo ${list[@]}'
echo ${list[*]}
echo ${list[@]}


echo "Special Variables"
echo "_________________"
 echo "prints the script name--"
 echo $0     
 echo "prints the first argument--"
 echo $1     
 echo "prints the second argument--"
 echo $2     
 echo "prints the ninth argument--"
 echo $9      
 echo "prints the first argument, followed by 0--"
 echo $10   
 echo "prints the tenth argument--"
 echo ${10}   
 echo "prints the number of arguments--"
 echo $#      

 echo "$? refers to exit status of previous process"
echo "Thus 'true' produces 0--"
 true 
 echo $?
echo "And 'false' produces 1--"
 false 
 echo $?

echo "the process id of the current shell is accessible via \$\$ aka $$"
echo $$

echo "Bash can replace a string with another string--"
echo " foo=\"I'm a cat\". then echo \${foo/cat/rabbit}"
 foo="I'm a cat."
 echo ${foo/cat/rabbit}  # prints "I'm a dog."

 echo "Now foo equals I'm a cat, and she's a cat"
foo="I'm a cat, and she's a cat."
 echo ${foo/cat/dog}   # prints "I'm a dog, and she's a cat."
 echo ${foo//cat/dog}  # prints "I'm a dog, and she's a dog."

 echo "Without a replacement, it deletes:"

 foo="I like meatballs."
 echo ${foo/balls}       # prints I like meat.

#The ${name#pattern} operation removes the shortest prefix of ${name} matching pattern, while ## removes the longest:

 #minipath="/usr/bin:/bin:/sbin"
 echo ${minipath#/usr}           # prints /bin:/bin:/sbin
 echo ${minipath#*/bin}          # prints :/bin:/sbin
 echo ${minipath##*/bin}         # prints :/sbin
#The operator % is the same, except for suffixes instead of prefixes:

 minipath="/usr/bin:/bin:/sbin"
 echo ${minipath%/usr*}           # prints nothing
 echo ${minipath%/bin*}           # prints /usr/bin:
 echo ${minipath%%/bin*}          # prints /usr

echo "here we assign an array and then use the # sign to check its length"
echo "then we print out the length of the first element in the array."

ARRAY=(a b c)
 echo ${#ARRAY[@]}      # prints 3
 echo ${#ARRAY}         # prints 1

string="I'm a fan of dogs."
 echo ${string:6:11}           # prints fan

 array=(a b c d e f g h i j)
 echo ${array[@]:3:3}         # prints d e

  unset username
 echo ${username-default}        # prints default

 username=admin
 echo ${username-default}        # prints admin

unset foo
unset bar

 foo=30

#The + operator yields its value if the variable is set, and nothing otherwise:

 echo ${foo+42}    # prints 42
 echo ${bar+1701}  # prints nothing


  foo=bar
 bar=42
echo "assign foo to bar and bar to 42 then use  \${!foo} syntax to get bar value"
echo "with out the backslash \${!foo} just returns value--  ${!foo}. cool!"
 echo Hello Mr. ${!foo}
 
 echo ${!foo}  # prints $bar, which is 42

#Bash allows indirect variable/array look-up with the ! prefix operator.

 alpha=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
 char=alpha[12]

 echo ${!char} # prints ${alpha[12]}, which is m
 echo "Here we go-- heading into showargs"
 bash showargs.sh 0 "1  2  3   4"

bash interpolation.sh Earth


 echo {0,1}              # prints 0 1

 echo {0,1}{0,1}         # prints 00 01 10 11

 echo {0,1}{0,1}{0,1}    # prints 000 001 010 011 100 101 110 111

bash conditionals_for_flow_control.sh true 
bash conditionals_for_flow_control.sh false
bash conditionals_for_flow_control.sh true


# Subroutines
# Bash subroutines are somewhat like separate scripts.

# There are two syntaxes for defining a subroutine:

# function name {
#   commands
# }
# and:

# name () {
#   commands
# }
# Once declared, a function acts almost like a separate script: arguments to the function come as $n for the nth argument.

# One major different is that functions can see and modify variables defined in the outer script:

count=20

function showcount {
  echo $count
  count=30
}

showcount    # prints 20

echo $count  # prints 30


bash factered.sh 20 7

SECONDS=0; sleep 2; echo "Time elapsed since \$SECONDS was reset: $SECONDS seconds";


 ${12?failure: no 12th argument, you nitwit} # crashes the program if no first argument