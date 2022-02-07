#!/bash/bin 


git add .

echo 'What?'

read RESPONSE

git commit -m "$RESPONSE"

bash ./Specs/bin/run_unit_test.sh
# bash ./Specs/bin/run_integration_test.sh
bash ./Specs/bin/hello_world.sh