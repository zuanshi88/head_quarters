require 'json'


#prompt for missing info
#using ^for searching/open
#search, add, remove (check for duplicates)
#foreign address handler?
#code to stop repeats
#code to parse address
#code to prompt address input (widget of sorts)
#add time stamp and a sort by date function
#list all enties alphabetically...
#add touch_points

ENTRIES = "entries.txt"

def directory_access(file)
  directory = []
  object_directory = []
  File.open(file, "r").to_a.each {|entry| directory << JSON.parse(entry)}
  directory.each{|entry| object_directory << Entry.new(entry)}
  object_directory
end

class Session

  def initialize
    puts "  ==== === =   === === ===== = ======= ==== === ===== === == ==== = == =="
    puts "   ===  ==== ==== ===== === ==== ADDRESS BOOK 3 == = == == === =========== ====="
    puts "  =  ==  ===== == ======= === ==== == ===== ========= ===== ===== ======= ="
    puts "        search (9) |  add (1) | last contacts (3) | address list (6) | open (7)"
    puts "  = == ========= =========== == == ==== ============= ===== === = ===="
    puts "  ======== =============== ======== = = ====== ===== == ======== ========== =="
    puts "   === ===== == = = = ===== === ===== === == == = == ===== == === === === =="

  action = gets.to_i

  case action
  when 9
    search
  when 1
    add_entry
  when 3
    last_contacts
  when 6
    address_list
  when 7
    open_contact
  end
end

def entry_menu

  puts " === = == === = = = == = == =  === = === === ===== =="
  puts " edit (1) | note (2) | delete (3) | main menu (*) "
  puts " = === == ==  = = =  = = = ==== === = = = = = = = = = == "

  selection = gets.to_i

case selection

when 1
  edit
when 2
  note
when 3
  delete
else
  Session.new
end

end

# def search
#   puts "enter full name"
#   key_word = gets.chomp
#   directory_access = []
#   current_entries = directory_access(ENTRIES)
#   status = false
#     if directory_check(current_entries, key_word, status) == true
#       current_entries.each do |entry|
#         if entry["first name"] + ' '  + entry["last name"]  == key_word
#           display_contact(entry)
#           entry_menu
#         else
#           next
#         end
#     else
#       puts "No record yet"
#       Session.new
#     end
#   end
# end


# def directory_check(array, key_word, status)
#   array.each do |entry|
#     match_check = entry["first name"] + " " + entry["last name"]
#     match_check == key_word ? status = true : next}
#   end
#    status
# end


def open_contact
  search = gets.chomp
  directory = directory_access(ENTRIES)
  directory.each do |obj|
    if obj["first name"] == search
      display_contact(obj)
      entry_menu
    else
      next
    end
  end
end


def display_contact(obj)
  print obj["last name"]
  print ", "
  puts obj["first name"]
  address_hash = JSON.parse(obj["address"])
  puts address_hash["street_address"]
  print address_hash["city"]
  print ", "
  print address_hash["state"]
  print " "
  puts address_hash["zipcode"]
  puts obj["phone_number"]
  puts obj["email"]
  puts obj["touch_points"]
end



def add_entry
  puts "first name:"
  first_name = gets.chomp
  puts "last name:"
  last_name = gets.chomp

  puts "street address:"
  street_address = gets.chomp
  puts "city:"
  city = gets.chomp
  puts "state:"
  state = gets.chomp
  puts "zipcode"
  zipcode = gets.chomp
  address_hash = {:street_address => street_address,
                  :city => city,
                  :state => state,
                  :zipcode => zipcode
                }

  puts "phone:"

  phone_number = gets.chomp.to_s

  puts "email:"
  email = gets.chomp.to_s

  entry_info = {:first_name => first_name, :last_name => last_name, :address_hash => address_hash.to_json, :phone_number => phone_number, :email => email}

  new_entry = Entry.new(entry_info)
end


    def address_list
      directory = directory_access(ENTRIES)
      directory.each {|entry| puts JSON.parse(entry)["last name"]}
    end

end

class Entry

  attr_accessor :address_hash, :phone_number, :email, :age, :last_contact, :touch_points

  attr_reader :name, :first_name, :last_name, :content

def initialize(info)
    entry_info = {}
    entry_info.merge(info)
    @first_name = entry_info[:first_name]
    @last_name = entry_info[:last_name]
    @name = "#{self.first_name} #{self.last_name}"
    @email = entry_info[:email]
    @address_hash = entry_info[:address_hash]
    @phone_number = entry_info[:phone_number]
    @touch_points = []
    save_entry(JSON[self.content], ENTRIES)
    puts  "#{self.name} has been added."
Session.new
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
  @content = {"first name": "#{self.first_name}", "last name": "#{self.last_name}", "address_hash": "#{self.address_hash}", "touch_points": "#{self.touch_points}",
              "email": "#{self.email}", "phone_number": "#{self.phone_number}"}
end


  def save_entry(entry, file)
    updated_directory = []
    directory = directory_access(file)
    updated_entries = directory.unshift(entry)
    updated_entries.each {|entry| updated_directory << entry.to_json}
    write_file = File.open(file, "w")
    write_file.puts updated_directory
    write_file.close
  end


end


Session.new
