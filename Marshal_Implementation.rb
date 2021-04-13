require_relative 'address_book_module.rb'
require_relative 'Entry_Class.rb'
require_relative 'Touch_Point_Class.rb'
include Address_book_module

FILE = "backup_entries_3.txt"
FILE_2 ="backup_entries_4.txt"


neo_directory = marshal_directory(FILE_2)

selection = neo_directory.select{|obj| obj.name = "Dave Clauson"}

p selection[0].address

# hard_save_directory(directory, FILE)
