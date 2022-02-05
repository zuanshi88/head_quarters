#!/bash/bin

echo "Hello World"

# ruby ./directory_spec.rb 
# ruby ./head_quarters_spec.rb 
ruby ./integration/integration_touch_point_and_entry_spec.rb
ruby ./integration/integration_head_quarters_spec.rb

echo "Goodbye World"