require 'json'

require_relative 'address_book_module.rb'
require_relative 'Entry_Class.rb'

include Address_book_module

ENTRIES = 'entries_backup.txt'
#make a module of the utilities and mix it in and
#then you will have a much more refined testing structure.
#design program and all the function alities you want and hpw they will be achieved
#and then you design your tests to show that you can execute those functionalities


#
#
# puts "NEW street address"
# street_address = gets.chomp
# entry["address"]["street_address"] = street_address
# puts "City, State Zip"
# city_state_zip = gets.chomp
# city_state_zip.match(/(w+,?\s+?)(w+\s+?)(\d+)/)
# entry["address"]["city"] = city_state_zip[1]
# entry["address"]["state"] = city_state_zip[2]
# entry["address"]["zipcode"] = city_state_zip[3]
# save_database(entry, database)

directory = open_directory(ENTRIES)

puts directory.length
entry = directory.shift(1)
puts directory.length

dup_entry = entry[0].dup
puts "DUP:"

dup_entry.last_name = "Dickhead"

puts dup_entry
directory << entry

puts directory.length

puts directory.include?(entry)
puts directory.delete(entry)
puts directory.include?(entry)

puts directory.length
new_directory = directory.select{ |hash| hash == entry}
puts directory.length
puts directory.include?(entry)
puts "Does it have the dup entry?"
puts directory.include?(dup_entry)

puts "This is my new directory"
puts new_directory

# inventory_array.each_with_index {|hash, index| hash[attribute] == number ? inventory_array.delete_at(index) : next }

def reg_ex
puts "City, State Zip:"
city_state_zip = "Chicago, IL 60613"
search_format = /(\w+),?\s+(\w+)\s+(\d+)/
keyword_search_format = /(?<city>\w+),?\s+(?<state>\w+)\s+(?<zipcode>\d+)/
results = search_format.match(city_state_zip)
other_results = keyword_search_format.match(city_state_zip)
re = /(?<first>\w+)\s+((?<middle>\w+\.+)\s+)?(?<last>\w+)/
puts

puts "This is with index calls"

p results[1]
p results[2]
p results[3]
puts
puts "This is with keyword:"

p other_results[:city]
p other_results[:state]
p other_results[:zipcode]


# save_database(entry, database)
end
puts "++++++++++++++++++"
# reg_ex
puts "++++++++++++++++++"



string = ''
p string.class
array = string.split("")
p array.class
p string.empty?
# p directory

# search_word = "Aaron Whitmer"
# entry = directory.select{|hash, value| hash["name"] == search_word}
# p entry[0]

array = "[]"
p array.class

swtich = eval(array)
p swtich.class

variable = []

# 1) access array of hashes from file

directory_2000 = open_directory(ENTRIES)


# 2) convert array of hashes into array of objects

def array_of_objects(array_of_hashes)
  array_of_objects = []
  array_of_hashes.each{|hash| array_of_objects << Entry.new(hash)}
  array_of_objects
end

object_array = array_of_objects(directory_2000)

p object_array.length

# object_array.each {|obj| puts obj.address}


# 3) convert array of obj to array of hashs using entry_info method

def save_obj_array(obj_array)
  save_array = []
  obj_array.each{|obj| save_array << obj.entry_info}
  save_array
end

my_save_array = save_obj_array(object_array)

p my_save_array.class
p my_save_array.length
my_save_array



# 4) hard save array of hashes to disk

hard_save_directory(my_save_array, ENTRIES)


# repeat

neo_hash_directory = open_directory(ENTRIES)

puts "NEO HASH DIRECTORY"
p neo_hash_directory
puts "NEO HASH DIRECTORY "

neo_obj_directory = array_of_objects(neo_hash_directory)

p neo_obj_directory
p neo_obj_directory.class
p neo_obj_directory.length
p neo_obj_directory[0]
emily =  neo_obj_directory[10]
p emily.name
p emily.address
p emily.class

city_list = neo_obj_directory.map {|hash| hash.address["city"]}

p city_list.count("Portland")


name_array = neo_obj_directory.map{|obj| obj.name }




#
#   other_selection_array = directory_2000.select{|hash| hash["name"] == "Aaron Whitmer"}
#   other_other_selection_array = directory_2000.select{|hash| hash["name"] == "Dave Clauson"}
#
#   selection_array = directory_2000.select{|hash| hash["name"] == "Frank Bernacke"}
#   sample_entry = selection_array[0]
#
# puts sample_entry
# puts sample_entry
#
# david = directory_2000[1]
#
# hash_array = [sample_entry, directory[1], directory[10]]
# wild_hash = hash_array.pop(1)
# puts "======="
# p wild_hash[0]
# puts "======="
# p hash_array.unshift(wild_hash[0])
#
# updated_array = hash_array.push(wild_hash)
#
# name_hash = {}
# p updated_array.each{|hash, value| name_hash[hash["first name"]] = hash}
#
# p name_hash.sort_by{|hash, value| hash["touch_points"]}

#
# frank = Entry.new(sample_entry)
# aaron = Entry.new(other_selection_array[0])
# dave = Entry.new(other_other_selection_array[0])
#
# p aaron.name
# puts aaron.touch_points.length
#
# p frank.first_name
# p frank.last_name
# p frank.address["street_address"]
# p frank.street_address
# p frank.state
# p frank.zipcode
# p frank.touch_points
#
# def prepare_object(entry)
#   object = Entry.new(entry)
# end
