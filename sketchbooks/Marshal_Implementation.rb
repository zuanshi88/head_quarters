require_relative 'address_book_module.rb'
require_relative 'Entry_Class.rb'
require_relative 'Touch_Point_Class.rb'
include Address_book_module

FILE = "backup_entries_3.txt"
FILE_2 ="backup_entries_5.txt"


# my_directory = Directory.new(FILE_2)
#
# p my_directory.accounts[0].name

#
directory = File.open(FILE)
array_directory = directory.readlines
neo_directory = []
array_directory.each do |entry|
  info = Entry.new(eval(entry))
  neo_directory << info
end
#
# p neo_directory.class
#
#
# entry_hash = eval(array_directory[1])
#
#
marshal_save(neo_directory, FILE_2)




# hard_save_directory(directory, FILE)
