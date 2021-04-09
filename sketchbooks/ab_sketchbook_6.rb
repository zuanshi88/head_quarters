#12/22/2020 figure out what is going on wihtn writing adn reading to file and creating an obj.
#do something really simple.
# work on setting up you labs with efficiency and savvy.

require 'json'

require_relative 'address_book_module.rb'
require_relative 'Entry_Class.rb'

include Address_book_module

ENTRIES = 'entries_backup.txt'
otra_entries = 'backup_entries.txt'


obj_directory = open_directory(ENTRIES)


p obj_directory[0].entry_info

obj_directory[0].first_name = "Butterscotch"

p obj_directory[0]

p obj_directory[0].entry_info

search = "Aaron Whitmer"

name_array = obj_directory.map{|obj| obj.name }
p name_array.include?("David Birkey")

search = "David Birkey"

selection = obj_directory.select{|obj| obj.name == search}.pop
p selection.name

# @create_date = create_date.class == String ？eval(create_date) : create_date

test_string = "This is a test"

time = Time.new

string_time = time.to_s

# string_time.class == String ? eval(string_time) : string_time

puts "RESULTS:"

puts string_time.class


n = 3
puts n
puts n.integer?
puts n.class == Integer
puts 'fuck you'.class == String
# puts n.methods.sort


puts "____________________________"
def puts_result(n)
  puts n
end

# string_time.class == String ? answer = eval(string_time) : answer = string_time

p time
p time.class
p string_time
p string_time.class
p string_time




my_database = open_directory("entries_backup.txt")

# p my_database.length
# my_database[0].touch_points = []
# p my_database[0].touch_points


# my_database.each do |obj|
#   if obj.touch_points.nil?
#     obj.touch_points = []
#   elsif obj.touch_points.class == String
#     obj.touch_points = []
#   else
#     obj.touch_points.clear
#   end
# end
#
#
#
# my_database.each { |obj| p obj.touch_points}


neo_directory = open_directory(otra_entries)

p neo_directory[0].touch_points
neo_directory.each{|obj| p obj.touch_points}
