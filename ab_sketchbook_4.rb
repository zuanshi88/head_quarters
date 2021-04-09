require 'json'

require_relative 'address_book_module.rb'
require_relative 'Entry_Class.rb'

include Address_book_module

ENTRIES = 'entries_backup.txt'

directory = open_directory(ENTRIES)


# inventory_array.each_with_index {|hash, index| hash[attribute] == number ? inventory_array.delete_at(index) : next }

def reg_ex
puts "City, State Zip:"
city_state_zip = "Chicago, IL 60613"
search_format = /(\w+),?\s+(\w+)\s+(\d+)/
keyword_search_format = /(?<city>\w+),?\s+(?<state>\w+)\s+(?<zipcode>\d+)/
results = search_format.match(city_state_zip)
other_results = keyword_search_format.match(city_state_zip)
re = /(?<first>\w+)\s+((?<middle>\w+\.+)\s+)?(?<last>\w+)/
end

# puts "This is with index calls"
#
# p results[1]
# p results[2]
# p results[3]
# puts
# puts "This is with keyword:"
#
# p other_results[:city]
# p other_results[:state]
# p other_results[:zipcode]
#

# save_database(entry, database)

puts "++++++++++++++++++"
# reg_ex
puts "++++++++++++++++++"



# 1) create an array of objects

 directory_2000 = open_directory(ENTRIES)


# 2) convert array of hashes into array of objects

def array_of_objects(array_of_hashes)
  array_of_objects = []
  array_of_hashes.each{|hash| array_of_objects << Entry.new(hash)}
  array_of_objects
end

# object_array = array_of_objects(directory_2000)



# object_array.each {|obj| puts obj.address}


# 3) convert array of obj to array of hashs using entry_info method

def save_obj_array(obj_array)
  save_array = []
  obj_array.each{|obj| save_array << obj.entry_info}
  save_array
end






# 4) hard save array of hashes to disk

# hard_save_directory(my_save_array, ENTRIES)


# repeat

neo_obj_directory = open_directory(ENTRIES)



name_array = neo_obj_directory.map{|obj| obj.name }

p name_array
p name_array.length
p name_array[0]

search = "Rob & Jamie Beranek"

selection = name_array.select{|entry| entry == search}
p selection


def my_selection(search, database)
  selection = database.select{|entry| entry.name == search}
end

choice = my_selection("Dave Clauson", neo_obj_directory)

findling = choice[0]

puts findling.name
puts findling.street_address
puts "#{findling.city}, #{findling.state} #{findling.zipcode}"

#okay... what about sort by?

name_search = Proc.new { |obj| obj.name == search}

class Touch_Point

  attr_reader :date, :create_date, :activity, :person

  def initialize(create_date, activity, obj)
if date.class == String
  eval(date)
end
@create_date = create_date
@date = @create_date.strftime("%m/%d/%Y")
@activity = activity
@tp_info = {"create_date" => @create_date, "activity" => @activity}
@person = obj.name

end
end



my_tp = Touch_Point.new(Time.new, "Wrote a letter, mailed it", findling)

p my_tp.person



 database_emum = neo_obj_directory.to_enum(:select)
 name_match = database_emum.each(&name_search)
 p name_match[0].street_address

 # name.call(search)
