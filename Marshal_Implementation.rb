require_relative 'address_book_module.rb'
require_relative 'Entry_Class.rb'
require_relative 'Touch_Point_Class.rb'
include Address_book_module

FILE = "backup_entries_3.txt"
FILE_2 ="backup_entries_4.txt"

directory = Directory.new(FILE_2)

directory.accounts_index["Frank"].each{|obj| puts obj.name}





# hard_save_directory(directory, FILE)
