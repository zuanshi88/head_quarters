#!/bash/bin 


git add .

echo 'What?'

read RESPONSE

git commit -m "$RESPONSE"

bash ./Specs/bin/hello_world.sh