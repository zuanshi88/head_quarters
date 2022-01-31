#!/bin/bash

echo $1

 world=$1
 foo='Hello, $world!'
 bar="Hello, $world!"
 echo $foo            # prints Hello, $world!
 echo $bar            # prints Hello, Earth!
 date 
 cat <<UNTILHERE
 
    Testing to see if this will all be printed out.

    If so, this would be a great way to deliver text.

UNTILHERE