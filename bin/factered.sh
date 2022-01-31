#!/bash/bin  

factered () {

    echo ""
    echo "Are we getting here? $1"

echo $1 

  declare -i result
  declare -i n

  n=$1
  result=1

  while (( n >= 1 ))
  do
    result=n*result
    n=n-1
    echo "n is $n and result is $result"
  done

  echo $result
  echo $n
  echo $2
  echo "What is going on?"
}

factered