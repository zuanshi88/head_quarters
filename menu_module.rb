module Menu 


#could have a menu module
  def main_menu(status = true)

    if status == true 
      system("cls")
    end 

    30.times{puts ""}

    puts "                                                                 ==== === =   === === ===== = ======= ==== === ===== === == ==== = == =="
    puts "                                                                  ===  ==== ==== ===== === ==== ADDRESS BOOK 7 == = == == === =========== ====="
    puts "                                                                  =  ==  ===== == ======= === ==== == ===== ========= ===== ===== ======= ="
    puts "                                                                     add (1) |  touch points (3) | contacts (6) | open (7) | exit (*)"
    puts "                                                                   = == ========= =========== == == ==== ============= ===== === = ===="
    puts "                                                                   ======== =============== ======== = = ====== ===== == ======== ========== =="
    puts "                                                                 === ===== == = = = ===== === ===== === == == = == ===== == === === === =="

        action = gets.to_i

        case action
        when 1
          marshal_save(save_entry(add_entry, database.accounts), ENTRIES)
        when 3
          touch_points_menu
        when 6
          directory(database.accounts)
          main_menu(false)
        when 7
          open_contact
          main_menu
        else
          exit
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

        touch_points = []

        entry_info = {"first name" => first_name, "last name" => last_name, "address" => address, "phone number" => phone_number, "email" => email, "name" => name, "touch_points" => touch_points}
        entry_info
      end


      def directory
        #this is all pushed way over for easier reading upon display
        alphbetic_directory = @database.sort_by{|obj| obj.last_name.downcase}
          puts ""
          puts ""
          puts "                                                                _________________________________________________________________________"
          puts ""
        alphbetic_directory.each do |entry|
          puts "                                                                  - #{entry.last_name}, #{entry.first_name} |  #{entry.street_address} | #{entry.city}, #{entry.state} #{entry.zipcode} - "
          puts "                                                                _________________________________________________________________________"
          puts ""
        end
      end


      def display_contact(obj)
        # 1st  used address_hash = JSON.parse(obj["address"])
        # 2nd did the JSON conversion earlier and then used HASH KEYS to access info_hash
        # 3rd decided to initiate defined ENTRY obj before displaying or editing.

        %x(echo clr)
        center_text(obj.name)
        puts ""
        center_text(obj.street_address)
        puts ""
        center_text(obj.city)
        print " "
        print obj.state
        print " "
        puts obj.zipcode
        center_text(obj.phone_number)
        puts ""
        center_text(obj.email)
        puts ""
        if obj.touch_points.empty?
          puts ""
        else
          tp_obj_array = obj.touch_points
          sorted_tp_obj_array = tp_obj_array.sort_by{|tp| tp.date_obj }.reverse
          puts ""
          sorted_tp_obj_array.each { |tp| center_text("#{tp.date}: #{tp.activity}"); puts ""}
        end
          2.times{puts""}
      end

#12/15/2020: how to delete a hash in an array of hashes?


    def open_contact
        target = gets.chomp
      begin
        result = @database.search(target.downcase)
      rescue
        p "#{target} not found. Try again."
        open_contact
      end
        # system("cls")
        drop_center
        entry_menu(result)
    end

      def entry_menu(entry)
        system('clear')
        drop_center
        puts "                                                                === === ===== = ======= ==== === ===== === == ==== = == =="
        puts "                                                                 = = = == === = = = == = == =  === = === === ===== =="
        puts "                                                                      edit (1) | all (5) | add (9) | main menu (*)"
        puts "                                                                === == ==  = = =  = = = ==== === = = = = = = = = = == "
        puts "                                                                === === ===== = ======= ==== === ===== === == ==== = == =="
        puts " "
        puts " "   
        display_contact(entry)
      
        
        selection = gets.to_i

        case selection

        when 1
          edit(entry)
        when 5
         entry.touch_points.each { |tp| puts "          #{tp.date}: #{tp.activity}"}
        when 6 
          show_last_ten(entry)
        when 9
          add_touch_point(entry)
        else
          system("cls")
          main_menu
       end

      end

      def edit(entry)
        puts "                                                                === === ===== = ======= ==== === ===== === == ==== = == =="
        puts "                                                          == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = ==   = = ="
        puts "                                                        === == = == =  == =  === = = = = === = = =  ===  === =  == = =  === = = === = = "
        puts "                                                          name (1) | address (2) | phone (3) | email (4) | touch points (6) | delete (7) | entry menu (*)"
        puts "                                                         == = = = =  == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = == == = ="
        puts "                                                         = = == = ==  = = = == =  == =  === = = = = === = = =  ===  === =  == = =  === = =  = = "

        selection = gets.chomp

        #dup the entry to remove to preserve original copy in order to delete original
        #from database array after editing and before re-adding edited area to avoid
        #entry duplication.



        case selection.to_i
        when 1
          puts "NEW first name:"
          first_name = gets.chomp
          entry.first_name =  first_name
          puts "NEW last name"
          last_name = gets.chomp
          entry.last_name = last_name
        when 2
          puts "NEW street address"
          street_address = gets.chomp
          entry.street_address = street_address
          puts "City, State Zip"
          city_state_zip = gets.chomp
          search_form = /(\w+),?\s+(\w+)\s+(\d+)/
          results = search_form.match(city_state_zip)
          entry.city = results[1]
          entry.state = results[2]
          entry.zipcode = results[3]
        when 3
          puts "NEW phone number"
          phone_number = gets.chomp
          entry.phone_number = phone_number
        when 4
          puts "NEW email"
          email = gets.chomp
          entry.email = email
        when 6
          tp_hash = {}
          unless entry.touch_points.empty?
          entry.touch_points.each_with_index do |tp, i|
            tp_hash[i] = tp
          end
        end
        puts "this hash has #{tp_hash.size} elements"
          tp_hash.each{|k,v| puts "#{k}: #{v.date}, #{v.activity}"}
          puts "Delete \# ?"
          delete_tp = gets.to_i
          tp_hash.delete(delete_tp)
          entry.touch_points.delete_at(delete_tp)
        when 7
          puts "Are you sure?"
          response = gets.chomp
          index = @database.accounts.index(entry)

          response.downcase.include?("y") ? @database.accounts.delete_at(index) : entry_menu(entry)
          marshal_save(@database.accounts, ENTRIES)
          main_menu
        else
          entry_menu(entry)
      end
      #have I moved away from the dup design?
        save_update(entry)
        display_contact(entry)
        edit(entry)
       end


end 