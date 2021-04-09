#12/22/2020 figure out what is going on wihtn writing adn reading to file and creating an obj.
#do something really simple.
# work on setting up you labs with efficiency and savvy.
require 'json'

require_relative 'address_book_module.rb'
require_relative 'Entry_Class.rb'

include Address_book_module

ENTRIES = 'entries_backup.txt'
otra_entries = 'backup_entries.txt'

neo_directory = open_directory(otra_entries)

neo_directory.each{|obj| obj.touch_points = []}

hard_save_directory(neo_directory, otra_entries)

neo_neo_directory = open_directory(otra_entries)

neo_neo_directory.each{ |obj| p obj.touch_points}
