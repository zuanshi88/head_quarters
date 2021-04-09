require 'json'

ENTRIES = "entries_branch_1.txt"

#should this methods be stored here? or inside SESSION?


# can I access the ENTRIES and convert them to HASHes and put them back?
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

      def save_entry(entry, file)
        directory = open_directory(file)
        #need to move the other ones into the list
        updated_entries = directory << entry
        write_file = File.open(file, "w")
        write_file.puts updated_entries
        write_file.close
      end

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
        fudge_width = search_hash.merge(hash).length - search.uniq.length
        fudge_width <= 0 ? capture_hash_and_index(hash,index, matches) : next
         end
        puts "This is a match:"
        unless matches.empty?
          puts matches
        end
        unless matches.empty?
          result = data_array[matches[1]]["name"]
          result
        end
      end

class Session

  def initialize
    puts "  ==== === =   === === ===== = ======= ==== === ===== === == ==== = == =="
    puts "   ===  ==== ==== ===== === ==== ADDRESS BOOK 3 == = == == === =========== ====="
    puts "  =  ==  ===== == ======= === ==== == ===== ========= ===== ===== ======= ="
    puts "                  add (1) | last (3) | all (6) | open (7)"
    puts "  = == ========= =========== == == ==== ============= ===== === = ===="
    puts "  ======== =============== ======== = = ====== ===== == ======== ========== =="
    puts "   === ===== == = = = ===== === ===== === == == = == ===== == === === === =="

        action = gets.to_i



        case action
        when 1
          save_entry(add_entry, ENTRIES)
        when 3
          last_contacts
        when 6
          directory(ENTRIES)
        when 7
          open_contact(ENTRIES)
        end

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
        address = {"street_address" => street_address,
                        "city" => city,
                        "state" => state,
                        "zipcode" => zipcode
                      }
        name = "#{first_name} #{last_name}"

        puts "phone:"

        phone_number = gets.chomp.to_s

        puts "email:"
        email = gets.chomp.to_s

        entry_info = {"first name" => first_name, "last name" => last_name, "address" => address, "phone number" => phone_number, "email" => email, "name" => name}
        entry_info
      end

      def directory(file)
        directory = open_directory(ENTRIES)
          puts "    _________________________________________________________________________"
          puts ""
        directory.each do |entry|
          puts "      - #{entry["last name"]}, #{entry["first name"]} |  #{entry["address"]["street_address"]} | #{entry["address"]["city"]}, #{entry["address"]["state"]} #{entry["address"]["zipcode"]} - "
          puts "    _________________________________________________________________________"
          puts ""
        end
      end

      def display_contact(obj)
        # address_hash = JSON.parse(obj["address"])
        puts obj["address"]["street_address"]
        print obj["address"]["city"]
        print ", "
        print obj["address"]["state"]
        print " "
        print obj["address"]["zipcode"]
        puts obj["phone_number"]
        puts obj["email"]
        puts obj["touch_points"]
      end

      def open_contact(file)
        search = gets.chomp
        new_directory = open_directory(file)
        if search_exist?(search, new_directory) == true
        display_contact(hash_name_compare(search, new_directory))
        entry_menu(hash_name_compare(search, new_directory))
        else
          puts "No match found."
          Session.new
        end
      end

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
          fudge_width = hash.merge(search_hash).length - hash.length
          fudge_width <= 0 ? capture_hash_and_index(hash,index,matches) : next
           end
            result = data_array[matches[1]]
            result
        end

      def search_exist?(search, directory)
        exist = false
        directory.each do |entry|
          if entry["name"] == search
            exist = true
          else
            next
          end
        end
        exist
      end



      def entry_menu(entry)

        puts "     === = == === = = = == = == =  === = === === ===== =="
        puts "      edit (1) | note (2) | delete (3) | main menu (*) "
        puts "    = === == ==  = = =  = = = ==== === = = = = = = = = = == "

        selection = gets.to_i

        case selection

        when 1
          edit(entry)
        when 2
          note(entry)
        when 3
          delete(entry)
        else
          Session.new
        end

      end

      def edit(entry)
        puts " == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = ==   = = ="
        puts "  = == =  == =  === = = = = === = = =  ===  === =  == = =  === = = === = = "
        puts "    name (1) | address (2) | phone (3) | email (4) | touch points (5) "
        puts "  == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = == == = ="
        puts " = == =  == =  === = = = = === = = =  ===  === =  == = =  === = =  = = "

        selection = gets.chomp

        case selection
        when 1
          first_name = gets.chomp
          puts "New first name:"
          entry["first name"] =  first_name
          last_name = gets.chomp
          puts "New last name"
          entry["last name"] = last_name
        when 2

        when 3

        when 4

        when 5
         end

       end
    end



Session.new

#TO DO list
# clean up code, get better with comments.
#prompt for missing info
#using ^for searching/open
#search, add, remove (check for duplicates)
#foreign address handler?
#code to stop repeats
#add time stamp and a sort by date function
#list all enties alphabetically...
#add touch_points
