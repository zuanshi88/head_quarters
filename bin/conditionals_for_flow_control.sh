#!/bash/

echo `clear`
echo `date`

echo `bash bash_journal.sh`

echo ""
echo "This is testing flow control when input is: $1"

# this will print:
if [ $1 == true ]
then  
  echo "Printed, My friend"
fi 

# this will not print:
if [ $1 = false ]
then  
  echo "No, way am I printing that, my friend!"
fi 

# if httpd -k start
# then
#   echo "httpd started OK"
# else
#   echo "httpd failed to start"
# fi

# In bash, many conditions are built from the special command test.

# The command test takes many flags to perform conditional tests.

# Run help test to list them all.

# Some popular flags include:

# -e file is true iff a specific file/directory exists.
# -z string is true iff the given string is empty.
# string1 = string2 is true iff the two strings are equal.