#!/bash/bin 

echo ""

stage=$(git add . )

stage 

echo 'What would you like to record? -- make it good.'

read RESPONSE

git commit -m "$RESPONSE"

bash ./bin/run_unit_test.sh
bash ./bin/run_integration_test.sh
