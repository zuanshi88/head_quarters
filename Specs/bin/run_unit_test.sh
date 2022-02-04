#!/bash/bin

echo "hello world"


#modules-- what do I test with those
#separate the unit and integration tests
#could I get a gem for some kind of ghost program?
#this is a great model for having a bash command center for testing and design and 
#building the app from here.  

#could fork it and do a lot of things -- maybe have a flag for whether
#or not to run all of the tests or only certain ones. 

ruby ./entry_spec.rb 
ruby ./directory_spec.rb 
ruby ./touch_point_spec.rb
ruby ./project_spec.rb 

# ruby ./head_quarters_spec.rb
# ruby ./word_index_spec.rb


echo "Goodbye world"