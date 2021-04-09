#12/22/2020 figure out what is going on wihtn writing adn reading to file and creating an obj.
#do something really simple.
# work on setting up you labs with efficiency and savvy.
include Enumerable

require 'json'

require_relative 'address_book_module.rb'
require_relative 'Entry_Class.rb'

include Address_book_module

ENTRIES = 'entries_backup.txt'
otra_entries = 'backup_entries.txt'

def display_contact(obj)
  # 1st  used address_hash = JSON.parse(obj["address"])
  # 2nd did the JSON conversion earlier and then used HASH KEYS to access info_hash
  # 3rd decided to initiate defined ENTRY obj before displaying or editing.
  puts " "
  puts " "
  puts " "
  print "          ", obj.name
  puts ""
  print "          "
  puts obj.street_address
  print "          ", obj.city, ", "
  print obj.state
  print " "
  puts obj.zipcode
  print "          "
  puts obj.phone_number
  print "          "
  puts obj.email
  if obj.touch_points.class == String
    puts ""
  elsif obj.touch_points == nil
    puts ""
  else
    puts " "
    obj.touch_points.take(3)
    puts " "
end
    2.times{puts""}
end


obj_directory = open_directory(ENTRIES)

p obj_directory[0]

search  = "Frank Bernacke"


search_result = obj_directory.select{|obj| obj.name == search}.pop()

neo_directory = open_directory("test_database.txt")

p neo_directory[0].first_name
p neo_directory[0].last_name
p neo_directory[0].name
p neo_directory[0].entry_info

og_name = "Caleb Whitmer"
example_name = og_name.downcase.scan(/[\w]/).uniq

search_name = "aaron whitmer"
test_name = "Aaron Whitmer"
other_test_name = 'betsy birkey'
new = test_name.downcase.scan(/[\w]/).uniq
other = other_test_name.downcase.scan(/[\w]/).uniq
s_name = search_name.downcase.scan(/[\w]/).uniq


new =  name_hasher(new)
other =  name_hasher(other)
s_name =  name_hasher(s_name)

hash_array = []

hash_array << new
hash_array << other


p new.first == other.first
p new.first == s_name.first

selection = hash_array.select{|hash| hash.first == s_name.first}
puts "Here is the result"
puts selection[0].values.join{""}


my_search = "Caleb Whitmer"
my_matches = []

hash_name_compare(my_search, neo_directory, my_matches)


compare_name = name_hasher(my_search.downcase.split(""))


p compare_name.first

best_match = my_matches.select {|hash| hash[1].first == compare_name.first}
# select{|hash| hash.first == compare_name.first }
best_best_match = neo_directory[best_match[0][0]]

p best_best_match

#
# simplified_array = simplify(neo_directory)
# p simplified_array
#
#
# name_hashes = obj_to_fullname_hash(simplified_array)
# puts ""
# puts name_hashes
#
#
# puts
# p simple_name_hash = name_hasher(example_name)
#
# p simple_name_hash.class

matches = []

# p simplified_array
# p simplified_array
# p simplified_array.length
# p simplified_array[0]
# p simplified_array[0].class


# calculate_fudge(simple_name_hash, name_hashes, matches, og_name)




#
# puts new_matches.select{ |match| match[0] == }
# #
# # p matches
#
# lowest = matches.sort_by{|key, value| value }
# p neo_directory[lowest.first[0]]
