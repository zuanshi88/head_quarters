#!/bash/bin

echo "Hello World"

ruby ./Specs/integration/integration_directory_spec.rb 

ruby ./Specs/integration/integration_menu_module_spec.rb
ruby ./Specs/integration/integration_session_spec.rb

ruby ./Specs/integration/integration_touch_point_and_entry_spec.rb

echo "Goodbye World"