#!/bash/bin

echo "Hello World"

ruby integration/integration_directory_spec.rb 

ruby integration/integration_menu_module_spec.rb
ruby ./integration/integration_session_spec.rb

# ruby ./integration/integration_touch_point_and_entry_spec.rb

echo "Goodbye World"