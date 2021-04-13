#12/16/2020: Make a new menu to display different views of directory_hash
#alphbetic, last contact, etc, 




require 'json'
require_relative 'address_book_module.rb'

include Address_book_module

ENTRIES = "backup_entries.txt"


class Session

  attr_reader :database

  def initialize
    @database = open_directory(ENTRIES)
    main_menu
  end

  def main_menu
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
          directory(database)
          main_menu
        when 7
          open_contact(database)
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

        entry_info = {"first name" => first_name, "last name" => last_name, "address" => address, "phone number" => phone_number, "email" => email, "name" => name, "touch_points" =>""}
        entry_info
      end

      def directory(database)
        directory = database.sort_by{|hash, value| hash["last name"]}
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
        puts
        puts
        puts
        print "          ", obj["name"]
        puts ""
        print "          "
        puts obj["address"]["street_address"]
        print "          ", obj["address"]["city"], ", "
        print obj["address"]["state"]
        print " "
        puts obj["address"]["zipcode"]
        print "          "
        puts obj["phone_number"]
        print "          "
        puts obj["email"]
        if obj["touch_points"].class == String
          puts ""
        elsif obj["touch_points"] == nil
          puts ""
        else
          array = obj["touch_points"]
          puts
          puts array.take(3)
      end
          2.times{puts""}
        end
#12/15/2020: how to delete a hash in an array of hashes?
      def open_contact(database)
        search = gets.chomp
        target = hash_name_compare(search, database)
        name_array = database.select{|hash| hash["name"]}
        if name_array.include?(target) == true
        edited_database = name_array.delete(target)
        display_contact(target)
        entry_menu(target)
      else
          puts "No match found."
          main_menu
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

        puts "      = = = == === = = = == = == =  === = === === ===== =="
        puts "          edit (1) | all (5) | add (9) | main menu (*) "
        puts "       === == ==  = = =  = = = ==== === = = = = = = = = = == "

        selection = gets.to_i

        case selection

        when 1
          edit(entry)
        when 5

          # What's going on here
         entry["touch_points"].each_with_index{|point, index| index < 2 }
        when 9
          new_time = Time.new
          formated_date = new_time.strftime("%m/%d/%Y")
          update = gets.chomp
          new_entry = [formated_date, update]
          updated_touch_points = []
          updated_touch_points << new_entry
          unless entry["touch_points"] == nil
          touch_points = eval(entry["touch_points"])
          touch_points.each{|point| updated_touch_points << touch_points}
          end
          entry["touch_points"] = updated_touch_points
        else
          main_menu
        end

      end

      def edit(entry)
        puts "    == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = ==   = = ="
        puts "  === == = == =  == =  === = = = = === = = =  ===  === =  == = =  === = = === = = "
        puts "    name (1) | address (2) | phone (3) | email (4) | entry menu (9) | main menu (*) "
        puts " == = = = =  == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = == == = ="
        puts "  = = == = ==  = = = == =  == =  === = = = = === = = =  ===  === =  == = =  === = =  = = "

        selection = gets.chomp

        update = entry.dup

        case selection.to_i
        when 1
          puts "NEW first name:"
          first_name = gets.chomp
          update["first name"] =  first_name
          puts "NEW last name"
          last_name = gets.chomp
          update["last name"] = last_name
        when 2
          puts "NEW street address"
          street_address = gets.chomp
          update["address"]["street_address"] = street_address
          puts "City, State Zip"
          city_state_zip = gets.chomp
          search_form = /(\w+),?\s+(\w+)\s+(\d+)/
          results = search_form.match(city_state_zip)
          update["address"]["city"] = results[1]
          update["address"]["state"] = results[2]
          update["address"]["zipcode"] = results[3]
        when 3
          puts "NEW phone number"
          if update.keys.include?("phone number")
            update["phone number"] = phone_number
          else
            update[phone_number] = phone_number
          end
        when 4
          puts "NEW email"
          update["address"]["street_address"] = street_address
        when 9
          entry_menu(entry)
        else
          main_menu
      end
        save_database(entry, update, database)
        hard_save_directory(database, ENTRIES)
        puts "#{entry["name"]}: updated"
        edit(entry)
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
