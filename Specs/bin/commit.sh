#!/bash/bin 

echo ""

git add .

echo 'What would you like to record? -- make it good.'

read RESPONSE

git commit -m "$RESPONSE"


echo "UNIT TESTS COMMENCING"
bash ./bin/run_unit_test.sh
echo "UNIT TESTS COMPLETE"
echo "INTEGRATION TESTS COMMENCING"
bash ./bin/run_integration_test.sh
echo "INTEGRATION TESTS COMPETE for: "
echo "------------------------------------"
echo $RESPONSE
echo "------------------------------------"