require 'json'

ENTRIES = 'backup_entries.txt'

class Person

attr_reader :name, :job, :info_hash

  def initialize(hash)
      @name = hash["name"]
      @job = hash["job"]
      @info_hash = {"name" => @name, "job" => job}
      puts info_hash
  end
end

new_person = {"name" => "Micah", "job" => "programmer"}
aaron = {"name" => "Aaron", "job" => "poet"}
betsy = {"name" => "betsy", "job"=> "artist"}

obj_aaron = Person.new(aaron)
p obj_aaron.name
p obj_aaron.job
json_aaron = obj_aaron.info_hash.to_json

p json_aaron
comeback_aaron = JSON.parse(json_aaron)
puts "HEY DONT CALL IT A COMEBACK!!!"
p comeback_aaron["name"]

new_aaron = Person.new(comeback_aaron)
new_betsy = Person.new(betsy)

p new_aaron.name
p new_aaron.info_hash

p obj_aaron.info_hash == new_aaron.info_hash
# p new_aaron.name






string = "{\"first name\":\"Mary & Gary\",\"last name\":\"Whitmer\",\"address\":\"{\\\"street_address\\\":\\\"625 Minneapolis Avenue\\\",\\\"city\\\":\\\"Gladstone\\\",\\\"state\\\":\\\"MI\\\",\\\"zipcode\\\":\\\"49837\\\"}\",\"touch_points\":\"[]\",\"email\":\"\",\"phone_number\":\"906-428-4219\"}"

hash = JSON[string]
p hash
json_hash = JSON.parse(string)
puts json_hash["first_name"]
p hash
p json_hash.values[0]
address_hash = JSON[json_hash["address"]]
other_address_hash = JSON.parse(json_hash["address"])
p address_hash == other_address_hash
p other_address_hash["street_address"]
p address_hash["street_address"]




class Entry

  attr_accessor :first_name, :last_name, :name, :address_hash,
                :phone_number, :email,:last_contact, :touch_points


def initialize(info)
    @first_name = info["first_name"]
    @last_name = info["last_name"]
    @name = "#{self.first_name} #{self.last_name}"
    @email = info["email"]
    @address_hash = info["address_hash"]
    @phone_number = info["phone_number"]
    @touch_points = []
    save_entry(JSON[self.content], ENTRIES)
    puts  "#{self.name} has been added."
end

def last_contact= (date_and_event)
  self.touch_points.unshift(date_and_event)
  touch_points
end

def last_contact
  self.touch_points
end

def report
  puts "#{@name} lives at #{address} and can be reached at #{phone_number}. Last contact was #{last_contact}"
end

def content
  @content = {"first_name": "#{self.first_name}", "last_name": "#{self.last_name}", "address_hash": "#{self.address_hash}", "touch_points": "#{self.touch_points}",
              "email": "#{self.email}", "phone_number": "#{self.phone_number}"}
end


end

def open_directory(file)
  new_open_directory = []
  directory = File.open(file, "r")
  directory.each_line do |entry|
  hash_entry = JSON.parse entry.gsub("=>", ":")
  new_open_directory << hash_entry
  end
    directory.close
    new_open_directory
end

def string_to_hash_converter(file)
  new_directory = []
  directory = File.open(file, "r")
  directory.each_line do |entry|
    hash_entry = JSON.parse entry.gsub("=>",":")
    new_directory << hash_entry
  end
  directory.close
  new_write_to_file = File.open(file, "w")
  new_write_to_file. puts new_directory
end

entries = 'entries.txt'

puts "NOW we are here"

#this worked out really really and was a good way
#solve my string problem as I was using the info as a
#hash in my program, but storing it as a string and
#in need to converting it back to a hash upon its return.
def deep_json(file)
  updated_directory = []
  directory = open_directory(file)
  directory.each do |entry|
     entry["address"] = JSON[entry["address"]]
     updated_directory << entry
end
      write_to_file = File.open(file, "w")
      write_to_file.puts updated_directory
      write_to_file.close
end






# deep_json(entries)






puts "where are we?"



# newest_directory = open_directory(ENTRIES)
# puts "WHERE's WALDO"
# p newest_directory[0]["first name"]


test_entry = {"first name"=>"Feather & Ho-dawg", "last name"=>"Brown", "address"=>"{\"street_address\":\"17660 N.W.Cornell Rd #2\",\"city\":\"Beaverton\",\"state\":\"OR\",\"zipcode\":\"97000\"}", "touch_points"=>"[]", "email"=>"", "phone_number"=>""}


def save_entry(entry, file)
  directory = open_directory(file)
  #need to move the other ones into the list
  updated_entries = directory.unshift(entry)
  write_file = File.open(file, "w")
  write_file.puts updated_entries
  write_file.close
end

#this felt like breakthrought code as I was able to extend my thinking
#with the abstraction to grasp a fuller application of the save_entry method
# 10.times {save_entry(test_entry, ENTRIES)}

# def directory_access(file)
#   object_directory = []
#   File.open(file, "r").to_a.each{|entry| object_directory << (entry)}
#   object_directory
# end


# my_directory = File.open(ENTRIES, "r")
#
# puts "My Directory:"
# new_directory = []
# my_directory.to_a.each{|entry| new_directory << entry}
#
# puts new_directory.each{|entry| puts entry.class}
#
# new_new_directory = []
#
# new_directory.each {|entry| new_new_directory << JSON[entry]}
#
# puts "This is the first entry"
# puts new_new_directory[0]
# puts new_new_directory[0].class
#
# puts JSON[new_new_directory[5]].class
#
# puts new_directory
# puts new_new_directory
#
# write_to_file = File.open(ENTRIES, "w")
# write_to_file.puts new_new_directory





# new_address_hash = JSON.parse new_open_directory[0]["address"].gsub("=>", ":")
#
# p new_address_hash["street_address"]
#
# convert =  new_open_directory[8]
# puts "+++++++++++++++"
# p convert
# puts "+++++++++++++++"
#
# puts 'TESTING THE SAVING OF HASH ARRAY'
#
# write_to_file = File.open(ENTRIES, "w")
#
# write_to_file.puts new_open_directory
# puts new_open_directory
#
# new_new_directory
#
#

hash_as_string = "{\"0\"=>{\"answer\"=>\"1\", \"value\"=>\"No\"}, \"1\"=>{\"answer\"=>\"2\", \"value\"=>\"Yes\"}, \"2\"=>{\"answer\"=>\"3\", \"value\"=>\"No\"}, \"3\"=>{\"answer\"=>\"4\", \"value\"=>\"1\"}, \"4\"=>{\"value\"=>\"2\"}, \"5\"=>{\"value\"=>\"3\"}, \"6\"=>{\"value\"=>\"4\"}}"

ex_1_hash_as_string = JSON.parse hash_as_string.gsub('=>',':')
puts "============================================================"
puts "ex_1_hash_as_string = JSON.parse (hash_as_string)"
puts "============================================================"
p ex_1_hash_as_string
p ex_1_hash_as_string.class

puts "============================================================"
new_hash_as_string = JSON.parse hash_as_string.gsub('=>', ':')
puts "============================================================"
puts "new_hash_as_string = JSON.parse hash_as_string.gsub('=>', ':')"
puts "============================================================"
p hash_as_string
p hash_as_string.class
p new_hash_as_string
p new_hash_as_string.class
puts "==============================================================="



#WILL NEED 1 [12/09/2020] (12:02)getting closer to file object and playing
#around with it.
# .each {|entry| new_open_directory << JSON[entry]}
# puts "++++++++++++++++++++++++++++++"
# puts "This is the NEW OPEN DIR"
# puts new_open_directory
# new_open_directory.each {|entry| p entry.class}
#
# my_hash = new_open_directory[0]
#
# puts my_hash



address_hash = {"first_name" => "Aaron", "last_name" => "Whitmer", "street_address" => "1943 W. Cuyler #3", "city" => "Chicago", "State" => "IL"}

p address_hash["first_name"]

p test_entry.class




def add_key(file)
  hash_directory = open_directory(file)
  hash_directory.each do |entry|
    entry["name"] = "#{entry["first name"]} #{entry["last name"]}"
  end
  save_entry(hash_directory,file)
end


def entry_editor(entry = ENTRIES)
  #access hash_directory
  #select menu
  # name (1) etc..
  # save ideas - replace, , over write in has keys with << pop and push
neo_directory = open_directory(ENTRIES)
puts "this is neo directory's class"
p neo_directory.class

directory_hash = {}
neo_directory.map{|entry| directory_hash[entry["name"]] = entry }

puts "Here's my directroy hash"
puts "**************************"
puts directory_hash
puts "**************************"


p directory_hash.length

def search_and_print(search_word = "Aaron Whitmer")
focus_entry = directory_hash.select{|entry| entry == search_word}
focus_entry_hash = focus_entry[search_word]
puts
puts focus_entry_hash["name"]
puts focus_entry_hash["address"]["street_address"]
puts focus_entry_hash["address"]["city"] + ", " + focus_entry_hash["address"]["state"]
end

puts "My name is mud"




e = directory_hash.each

array =  e.select{|entry| entry["last name"] == "Whitmer"}
p array
end


neo_directory = open_directory(ENTRIES)
p neo_directory.class
p neo_directory.length
hashes = false
neo_class = neo_directory.include?(Array)
neo_directory.each{|entry| entry.class == Hash ? hashes = true : hashes = false}
puts "neo_directory is an array: #{neo_class} of hashes:#{hashes}"


def name_hasher(name)
  name_hash = {}
  name.downcase.split("").map{|char| name_hash[char] = char}
  name_hash
end

def hash_to_fullname_hash(data_array)
  name_hash_array = []
  data_array.each do |hash|
    name_hash_array << name_hasher(hash["name"])
  end
  name_hash_array
end


def capture_hash_and_index(hash, index, matches)
      match = hash.values.join("")
      matches << match
      matches << index
end

def hash_name_compare(search, data_array)
  hash_name_array = hash_to_fullname_hash(data_array)
  matches = []
  search_hash = name_hasher(search)
  hash_name_array.each_with_index do |hash, index|
  fudge_width = search_hash.merge(hash).length - search.length
  fudge_width <= 0 ? capture_hash_and_index(hash,index,matches) : next
   end
  puts "This is a match:"
  unless matches.empty?
    puts matches
  end
  unless matches.empty?
    result = data_array[matches[1]]["name"]
    puts result
  end
 end

 hash_name_compare("aon whitmer", neo_directory)
 # add_key(ENTRIES)

 #
 #
 # #
 # # p new_directory_hash.class
 # # p new_directory[1]
 # # other_new_hash = JSON[new_directory[1]]
 # # other_new_hash = JSON[other_new_hash]
 # # p other_new_hash.class
 # #
 # # new_directory.unshift(other_new_hash)
 # # puts " HERE IS WHERE WE START"
 # # p new_directory[0]
 # # p new_directory[0].class
 # # p back_to_json = JSON[new_directory[0]]
 # # p back_to_json.class
 # # p JSON[new_directory[0]]
 # # p JSON[back_to_json].class
 # # p JSON[back_to_json]
 # # puts
 # # hashes = new_directory.first(2)
 # # puts
 # # puts hashes
 # # #
 # # puts
 # # # hash_list = new_directory.map do |entry|
 # # #   entry.string? ?
 # # # end
 # #
 # # puts new_directory
 # #
 # # new_directory.each {|entry| puts entry.class}
 # # p new_directory[0].class == Hash
 # # p new_directory[3].class == String
 # #
 # # puts new_directory[1]
 # # puts new_directory[1].class
 # #
 # # puts "HASH TIME"
 # # new_hash = JSON[new_directory[1]]
 # # puts new_hash
 # # puts new_hash.class
 # # puts "BACK to String?"
 # # back_to_string = JSON[new_hash]
 # # puts back_to_string
 # # puts back_to_string.class
 # # puts "Back to Hash"
 # # puts JSON[back_to_string]
 # # puts JSON[back_to_string].class
 # #
 # # updated_directory = []
 # #   new_directory.each do |entry|
 # #     hashed_entry = JSON.parse(entry)
 # #     updated_directory << hashed_entry
 # #   end
 # #
 # #
 # #
 # # updated_directory.each {|entry| puts entry.class}
 # #
 # # puts
 # #
 # # puts updated_directory[2].class
 # #
 # # puts "What am I missing here?"
