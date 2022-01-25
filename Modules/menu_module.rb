require_relative 'menu_methods_module'
require_relative 'menu_display_module'
require_relative 'menu_action_module'

module Menu 


  include Menu_Methods
  include Menu_Action
  include Menu_Display


  def main_menu(status = true, message = "")

    if status == true 
      clear_drop_center
    end 


    display_main_menu
      
    center_text(message)

        action = gets.to_i

        case action
        when 1
          #menu call to the directory
          #solved this using Director#save_entry
          #01/24/2022-- still need to resolve 
          #editing persistency issues. 
          #Also need to encapsulate more depencies.
          marshal_save(Directory.save_entry(Entry.new(add_entry), @database.accounts), ENTRIES)
        when 3
          touch_points_menu
        when 6
            #fix this next
            #this is broken now-- I need to think about
            #how this should work...
          display_all_accounts(@database.accounts)
          main_menu(false)
        when 7
          target = gets.chomp
          downcase_target = target.downcase
          selection = @accounts_index[downcase_target]
          account_hash = create_selection_hash(selection) 
            if account_hash.length == 1
              open_contact(account_hash[0])
            else 
              account_hash.each_key{|key| center_text("#{key}: #{account_hash[key].name}"); puts ""}
              selection = gets.chomp
              open_contact(account_hash[selection.to_i])
            end 
        else 
          exit
        end
      end

      #interesting-- this is now a design issue

      def display_all_accounts(accounts)
        #this is all pushed way over for easier reading upon display
        
          puts ""
          puts ""
      
          accounts.sort_by{|obj| obj.last_name.downcase}.each do |entry|
              puts ""
              ["- #{entry.last_name}, #{entry.first_name} |  #{entry.street_address} | #{entry.city}, #{entry.state} #{entry.zipcode} - ",
              "_________________________________________________________________________"].each do |line|
                center_text(line)
              end 
          end
      end


      def display_contact(obj)
        # 1st  used address_hash = JSON.parse(obj["address"])
        # 2nd did the JSON conversion earlier and then used HASH KEYS to access info_hash
        # 3rd decided to initiate defined ENTRY obj before displaying or editing.
      
        %x(echo clr)
          [[obj.name, true], 
          [obj.street_address, true], 
          [obj.city, false]].each do |info, status|
            center_text(info, status)
          end 
          print " " + obj.state + " " + obj.zipcode 
          puts ""
          [obj.phone_number, obj.email].each do |info| 
            center_text(info)
          end 
          if obj.touch_points.empty?
            puts ""
          else
            puts ""
            sorted_tp_obj_array = obj.touch_points.sort_by{|tp| tp.date_obj }.reverse
            sorted_tp_obj_array.each { |tp| center_text("#{tp.date}: #{tp.activity}")}
          end
            2.times{puts""}
      end

#12/15/2020: how to delete a hash in an array of hashes?


    def open_contact(result)
        if result == nil 
          main_menu(status = true, message = "Account Not Found, Please select again")
        else 
          drop_center
          if result 
            entry_menu(result)
          end 
        end 
    end

      def entry_menu(entry, full = true)

        if full 
            clear_drop_center
        end 

        

        display_entry_menu
              

        puts " "   

        if full
          if entry != nil 
            display_contact(entry)
          else  
            puts "This isn't a valid account, try another selection"
            main_menu(false)
          end 
        end 

      
        selection = gets.to_i

        case selection

        when 1
          edit(entry)     
        when 5
          clear_drop_center
          last_ten_touch_points(entry)
        when 8
          create_date = add_touch_point
          tp = Touch_Point.new(entry, create_date)
          entry.touch_points << tp
          save_update(entry)
          system('cls')
          display_contact(entry)
          entry_menu(entry)
        when 9 
          entry_menu(entry)
        else
          system("cls")
          main_menu
       end

      end


        def edit(entry)

            display_edit_menu

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
              # an unnecessary delete. the tp_hass is all going away
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
              puts "Where is this?"
              entry_menu(entry)
          end
       end

   def touch_points_menu(status = true)

      if status 
        system("cls")
        drop_center
      end
        
    display_touch_point_menu

    selection = gets.chomp
    
    case selection.to_i

    when 3
      display_all_descending
    when 5
      from_today_descending
    when 7 
      clear_drop_center
      show_the_future 
    when 9 
      clear_drop_center
      last_ten_descending
    else
      main_menu
    end
    3.times {puts " "}
    touch_points_menu(false)
  end
end 