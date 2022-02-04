#!/bash/bin

echo "hello world"
TEST=1

ruby ./entry_spec.rb 
ruby ./directory_spec.rb 
ruby ./touch_point_spec.rb

echo "Goodbye world"