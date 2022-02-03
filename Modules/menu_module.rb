require_relative 'menu_methods_module'
require_relative 'menu_display_module'
require_relative 'menu_action_module'

module Menu 

  # dependencies
  # -- menu_methods_module
  # -- formatting module via head_quarters
  # -- menu_display_module


  include Menu_Methods
  include Menu_Action
  include Menu_Display


          def main_menu(status = true, message = "")

            if status == true 
              clear_drop_center
            end 


            display_main_menu
              
            drop_n_lines
            center_text(message, 50)

           # main_menu_options
           # -- head_quarters (save_update)
           # -- where should "last_ten_combined" go?
           # -- formatting 
           # -- menu display module

                action = gets.to_i

                case action
                when 3
                  save_update(Entry.new(add_entry_action))
                when 4
                    clear_drop_center
                    # display_last_ten_entry_touch_points_title
                    drop_n_lines
                  display(last_n_descending(10))
                    drop_n_lines
                  touch_points_menu(false)
                when 8
                  display_all_accounts(@database.accounts)
                  main_menu(false)
                when 9
                  display_account(select_account)
                else 
                  exit
                end
          end

        def select_account 
            puts "Enter name:"
            target = gets.chomp
            downcase_target = target.downcase
            @accounts_index[downcase_target]
        end 

  def display_account(selection) 
    # head_quarters
      
                  account_hash = create_selection_hash_action(selection) 
                    if account_hash.nil? 
                      main_menu(true, "      <<<<<<   try another selection #{selection} could not be located   >>>>>>")
                    
                    elsif  account_hash.length == 1
                      open_contact(account_hash[0])
                    else 
                      account_hash.each_key{|key| center_text("#{key}: #{account_hash[key].name}", 38); puts ""}
                      selection = gets.chomp
                      open_contact(account_hash[selection.to_i])
                    end 
  end 

      


  def display_all_accounts(accounts)
        #this is all pushed way over for easier reading upon display
        
            drop_n_lines(2)
      
          accounts.sort_by{|obj| obj.last_name.downcase}.each do |entry|
                drop_n_lines
              ["- #{entry.last_name}, #{entry.first_name} |  #{entry.street_address} | #{entry.city}, #{entry.state} #{entry.zipcode} - ",
              "_________________________________________________________________________"].each do |line|
                center_text(line, 50)
              end 
          end
  end


 def display_contact(obj)
        # 1st  used address_hash = JSON.parse(obj["address"])
        # 2nd did the JSON conversion earlier and then used HASH KEYS to access info_hash
        # 3rd decided to initiate defined ENTRY obj before displaying or editing.
      
        %x(echo clr)
        drop_n_lines
          [[obj.name, true], 
          [obj.street_address, true], 
          [obj.city, false]].each do |info, status|
            center_text(info, 50, status)
          end 

          print " " + obj.state + " " + obj.zipcode 
          drop_n_lines

          [[obj.phone_number, true], [obj.email, true]].each do |info, status| 
            center_text(info, 50, status)
          end 
            if obj.touch_points.empty?
              drop_n_lines
            else
              drop_n_lines
              # this is where we can cap the tp display of each entry
              obj.touch_points.sort_by{|tp| tp.date_obj }.last(15).reverse.each do |tp|
                center_text("#{tp.date}: #{tp.activity}", 38)
              end 
            end
            
            drop_n_lines(2)
 end


        def open_contact(result)
                if result == nil 
                  main_menu(status = true, message = "Account Not Found, Please select again")
                else 
                  drop_center
                  #removed if result code here, seemed unnecessary
                    entry_menu(result)
                end 
        end

        def entry_menu(entry, full = true)

              if full 
                  clear_drop_center
              end 


              display_entry_menu
              drop_n_lines  

              #why the double full???

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

              when 3
                edit(entry)   
                save_update(entry)
                refresh_database 
                entry_menu(entry)  
              when 4
                
                clear_drop_center
                display_last_ten_entry_touch_points_title  
                drop_n_lines(1)
                display_entry_tps(last_n_descending(10,entry))
                drop_n_lines(1)
                entry_menu(entry, full = false)
              when 8
                create_date = add_touch_point_action
                tp = Touch_Point.new(entry, create_date)
                entry.touch_points << tp
                save_update(entry)
                refresh_database 
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

        def entry_last_ten_descending(entry)
            entry.touch_points.last(10)
        end 

        def last_ten_touch_points(entry)
            display_entry_tps(last_n_descending(10,entry))
        end 


  def edit(entry)

            display_edit_menu

            selection = gets.chomp

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
            when 8
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
            when 9
              puts "Are you sure?"
              response = gets.chomp
              response.downcase.include?("y") ? save_update(entry, true) : entry_menu(entry)
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
              full_display(all_descending)
            when 5
              full_display(from_today)
            when 7 
              clear_drop_center
              full_display(the_future)
            when 8
                clear_drop_center
                display_last_ten_entry_touch_points_title
                drop_n_lines
                display(last_n_descending(10))
            when 9 
              display_account(select_account)
            else
              main_menu
            end
            drop_n_lines(3)
            touch_points_menu(false)
          end

          def from_today_descending
            display(from_today)
          end 
end 

      

     
