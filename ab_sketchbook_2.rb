require 'json'

ENTRIES = 'backup_entries.txt'
entries = 'entries.txt'
class Hashhound

  attr_reader :first_name, :last_name, :name

def initialize(hash)
  @first_name = hash["first_name"]
  @last_name = hash["last_name"]
  @name = "#{@first_name} #{@last_name}"
  puts "Another fine Hash Hound has arrived!"
end

end

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

address_hash = {"first_name" => "Aaron", "last_name" => "Whitmer", "street_address" => "1943 W. Cuyler #3", "city" => "Chicago", "State" => "IL"}

#   Objects and Data above
#------------------------------------------------
#   Utilities below

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


def save_entry(entry, file)
  directory = open_directory(file)
  #need to move the other ones into the list
  updated_entries = directory.unshift(entry)
  write_file = File.open(file, "w")
  write_file.puts updated_entries
  write_file.close
end


def add_key(file)
  hash_directory = open_directory(file)
  hash_directory.each do |entry|
    entry["name"] = "#{entry["first name"]} #{entry["last name"]}"
  end
  save_entry(hash_directory,file)
end

puts "This is the focus and print function"


  neo_directory = open_directory(ENTRIES)
  directory_hash = {}
    neo_directory.map{|entry| directory_hash[entry["name"]] = entry}

def search_and_print(directory_hash)
    search_word = "Aaron Whitmer"
    focus_entry = directory_hash.select{|entry| entry["name"] == search_word}
    focus_entry_hash = focus_entry[search_word]
          puts focus_entry_hash["name"]
          puts focus_entry_hash["address"]["street_address"]
          puts focus_entry_hash["address"]["city"] + ", " + focus_entry_hash["address"]["state"]
end

# search_and_print(neo_directory)

neo_search_word = "Aaron Whitmer"


directory_hash.keys.select{|key| key == neo_search_word}
my_key = directory_hash.keys.select{|key| key == neo_search_word}
p directory_hash[neo_search_word]

nueva_hash = directory_hash[neo_search_word]

last_name_array = []
directory_hash.keys.each {|key| last_name_array << directory_hash[key]["last name"]}

downcase_name_array = last_name_array.map(&:downcase)
p downcase_name_array

puts "Looking for Bob Noonan"
target_word = "parkoshima"
puts
puts "Included before downcase?"
puts last_name_array.include?(target_word)
puts "Included after downcase?"
puts downcase_name_array.include?(target_word.downcase)
target_index = downcase_name_array.index(target_word.downcase)
puts "WHere is this now?"


#accept results

puts

puts
p directory_hash[neo_search_word]["name"]
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "This is the result:"
focus_hash = neo_directory[target_index]
puts focus_hash["name"], focus_hash["address"]["street_address"]
print focus_hash["address"]["city"], ", ", focus_hash["address"]["state"], " "
puts focus_hash["address"]["zipcode"]
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
e = directory_hash

array =  e.select{|entry| entry["last name)"] == "Whitmer"}

puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#12/12/2020: Goals Input Fudger and data object (fully loaded at the start of each session)
# data structure could travel the session around, save everything at the close of the session.
puts "12/12/2020 14:20"

colors_hash = { 0 => "blue", 1 => "green", 3 => "yellow", 4 => "red", 5 => "orange"}


materials_hash = {"plastic" => "hard", "down" => "soft", "metal" => "hard", "wood" => "hard", "hay" => "soft"}


b_test_hash_array = [colors_hash, materials_hash]

p b_test_hash_array.length
p b_test_hash_array
#so here were can replace the sort by sort factor to query different aspects.

sort_factor = "last name"
alphabet_hash = neo_directory.sort_by{|hash| hash["last name"]}

sort_by_last_name = Proc.new {|hash| hash["last name"]}

neo_directory_2 = open_directory(ENTRIES)

p neo_directory_2

sorted_directory = neo_directory_2.sort_by{|hash| hash["last name"]}

#write something to overwrite the whole database
p sorted_directory

p alphabet_hash[0]


puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"



neo_directory = open_directory(ENTRIES)
p neo_directory.class
p neo_directory.length
hashes = false
p neo_class = neo_directory.is_a?(Array)
neo_directory.each{|entry| entry.class == Hash ? hashes = true : hashes = false}
puts "neo_directory is an array: #{neo_class} of hashes:#{hashes}"


def name_hasher(name)
  name_hash = {}
  name.downcase.split("").map{|char| name_hash[char] = char}
  name_hash
end

def hash_to_fullname_hash(data_array)
  name_array = []
  data_array.each{|hash| name_array << hash["name"]}
  downcase_name_array = name_array.map{|name| name.downcase}
  name_hash_array = []
  downcase_name_array.each do |name|
    name_hash_array << name_hasher(name)
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

 hash_name_compare("Arrn Whitmer", neo_directory)

 touch_points = "[10/10/20, 'Sent letter']"
 other_touch_point = "[10/23/20, 'received reply']"
 p touch_points.class
 touch_points << ", " + other_touch_point
 p touch_points

 neo_array = touch_points.split(",")
 p neo_array
 p neo_array.class


 my_array = "song song".split(" ")
p my_array.class
