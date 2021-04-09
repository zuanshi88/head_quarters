
#code to stop repeats
#code to parse address
#code to prompt address input (widget of sorts)
#add time stamp and a sort by date function

ENTRIES = []
class Address_Book
  attr_accessor :list
    def initialize
      @list = []
    end
    def add(entry)
      @list << entry.name
    end

    def list
      puts @list
    end

  end




class Entry < Address_Book

attr_accessor :name, :address, :phone_number, :email, :age, :last_contact, :touch_points

attr_reader :content

def initialize(name, address)
  @name = name
  @address = address
  @touch_points = []
  @phone_number = "UPDATE!"
  ENTRIES << self
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



end

my_addresses = Address_Book.new

aaron_whitmer = Entry.new("Aaron Whitmer","")
my_addresses.add(aaron_whitmer)

aaron_whitmer.address = "1943 W. Cuyler Ave. #3 Chicago, IL 60613"

aaron_whitmer.phone_number = 77306730803

aaron_whitmer.email = "adwhitmer@gmail.com"
aaron_whitmer.age = 40

p "Aaron's email is #{aaron_whitmer.email}"

p aaron_whitmer
p aaron_whitmer.age
p "#{aaron_whitmer.age + 1}"

aaron_whitmer.report

aaron_whitmer.phone_number = "445-989-0987"

aaron_whitmer.report

puts "======================="
aaron_whitmer.last_contact = "2019/02/03: letter  "


aaron_whitmer.last_contact = "2020/01/26: email"


puts "=============================="

betsy_birkey = Entry.new("betsy birkey", "")

betsy_birkey.address = "1943 W. Cuyler Ave. #3 Chicago, IL 60613"

my_addresses.add(betsy_birkey)

Address_Book
betsy_birkey.report
betsy_birkey.phone_number = "773-658-3287"




betsy_birkey.report

my_addresses.add(betsy_birkey)
my_addresses.add(aaron_whitmer)

p aaron_whitmer.phone_number
p aaron_whitmer.address
p aaron_whitmer.last_contact = "2019/06/12: visit in the hospital"

p aaron_whitmer.last_contact

aaron_whitmer.last_contact = "2020/12/26: meet for a drink"

p aaron_whitmer.last_contact

p aaron_whitmer.address
p betsy_birkey.address

mary_whitmer = Entry.new("Mary Whitmer", "")

mary_whitmer.address = "625 Minneapolis Ave. Gladstone, MI 49837"
mary_whitmer.phone_number = "906-428-4219"
mary_whitmer.report
puts mary_whitmer.address
patricia_summersett = Entry.new("Patricia Summersett", "")
patricia_summersett.last_contact = "2010/01/26 upated address book"
puts
puts aaron_whitmer.last_contact.reverse
my_addresses.add(mary_whitmer)
patricia_summersett.address = "6388 de Gaspe Montreal, Qc H2S2x7 Canada"
patricia_summersett.report
puts
puts patricia_summersett.last_contact
my_addresses.add(patricia_summersett)
sally_birkey = Entry.new("Sally Birkey", "")

sally_birkey.address = "2725 Dunbrooke Ct. Ft. Wayne, IN 46804"

sally_birkey.report
sally_birkey.phone_number = "260-432-8263"
sally_birkey.report
my_addresses.add(sally_birkey)
 p aaron_whitmer.touch_points

 alyssa_bornhoft = Entry.new("Alyssa Bornhoft", "2504 S. Purdue Ave. Sioux Falls, SD 57106")
 marc_pickleman = Entry.new("Marc Pickleman", alyssa_bornhoft.address)
p marc_pickleman.address
p alyssa_bornhoft.address
p patricia_summersett.address
erik_anderson = Entry.new("Erik Anderson", "")
erik_anderson.phone_number = "651-587-8404"
p erik_anderson.phone_number
erik_anderson.address = "17937 St. Croix Trail N, Marine-on-St. Croix, MN, 55407"
p erik_anderson.address
erik_anderson.report
my_addresses.add(alyssa_bornhoft)
my_addresses.add(erik_anderson)
my_addresses.add(marc_pickleman)
my_addresses.list
caitlin_whitmer = Entry.new("Caitlin Whitmer", "2987 Berthiaume Drive, Bay City, MI 48706")
stephen_rogers = Entry.new("Stephen Rogers", "175 Van Dyke Street suite 324A, Brooklyn, 11231")
stephen_rogers.last_contact = "2020/04/06: Ecuador Gualea Java"
p stephen_rogers.touch_points

p stephen_rogers.touch_points

p patricia_summersett.touch_points

p stephen_rogers.report

my_addresses.list

mary_whitmer.last_contact = "05/11/2020: Mother's Day Letter"

p mary_whitmer.touch_points
p mary_whitmer.last_contact
p mary_whitmer.report

erik_anderson.last_contact = "05/07/2020: Zoom call with Phil & Dave"
erik_anderson.last_contact = "05/09/2020: Mailed small square letter to family"
erik_anderson.report

caleb_whitmer = Entry.new("Caleb Whitmer", "2819 4th St. NE Apt.2 Washington, D.C. 20002")
caleb_whitmer.last_contact = "05/11/2020: Esme wrote Morgan a letter"
caleb_whitmer.phone_number = "906-399-8638"

caleb_whitmer.report
marcus_whitmer = Entry.new("Marcus Whitmer", "2026 Martin Ave. SE, Grand Rapids, MI, 49507")
my_addresses.add(marcus_whitmer)
marcus_whitmer.report
p ENTRIES.length

file_array = []
ENTRIES.each {|entry| file_array << entry.content}
write_file = File.open("entries.txt", "w")
write_file.puts file_array
