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

            center_text(message, 25)


                action = gets.to_i

                case action
                when 2 
                 clear_drop_center 
                 initiate_touch_point_search
                when 3
                  @database.save_update(Entry.new(add_entry_action))
                  refresh_database_instance
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
                  clear_drop_center
                  initiate_account_search
                else  
                  clear_drop_center
                  exit 
                end
                 drop_n_lines(3)
                 main_menu(false)
          end

        def initiate_touch_point_search 
                  lev_search = @database.lev_tp_search(select_keyword_action)
                  #selection will be ARRAY of objs
                  selection = @database.touch_points_index[lev_search]
                  selection = selection.uniq.sort_by{|tp| tp.date_obj}
                
                if selection == nil 
                    main_menu(true, "Try another search-- nothing doing!!")
                end 

                  display_touch_point_index_results(selection, create_selection_hash_action(selection))

        end 

        def initiate_account_search

                  lev_search = @database.lev_acc_search(select_keyword_action)

                  selection = @database.accounts_index[lev_search]
                  selection = selection.uniq.sort_by{|acc| acc.last_name}

                  accounts_hash = create_selection_hash_action(selection)

                  if selection == nil || accounts_hash.empty?
                    main_menu(true, "<<<<<<<<<   Try another search, my friend   >>>>>>>")
                  else 
                    display_account(selection, accounts_hash)
                  end 

       end 

        # def touch_point_search(selection)
        #           # @database.touch_points_index.keys do |key|
        #           #   if key.downcase =~ /search/
        #           #     selection << @database.touch_points_index[key]
        #           #   end  
        #           # end
                  
                  
        # end 

        def open_contact(result)
                if result == nil 
                  main_menu(status = true, message = "Account Not Found, Please select again")
                else 
                  drop_center
                  #removed if result code here, seemed unnecessary
                    entry_menu(result)
                end 
        end

        def entry_menu(entry, full = true, message = '')

              if full 
                  clear_drop_center
              end 


              display_entry_menu
              drop_n_lines  

              #why the double full???

              if full
                if entry != nil 
                  display_contact(entry)
                  center_text(message, 25)
                else  
                  puts "This isn't a valid account, try another selection"
                  main_menu(false)
                end 
              end 

          
              selection = gets.to_i

              case selection
              when 4
                   if entry.files.nil?
                        entry_menu(entry, false, "Sorry, Charlie, no files yet")
                    else  
                        display_files(create_selection_hash_action(entry.files))
                    end 
            
              when 1 
                clear_drop_center 
                  # @database.save_update(Entry.new(add_entry_action))
                  # refresh_database_instance
                @database.create_entry_file(entry, add_entry_file_action)
                refresh_database_instance
                system('cls')
                entry_menu(entry, false)
                
              when 2
                clear_drop_center
                display_entry_menu
                entry_index = @database.index_touch_points(entry.touch_points)
                search = @database.lev_tp_search(select_keyword_action, entry_index)
                selection = entry_index[search]
                  if selection == nil 
                    main_menu(true, "Try another search-- nothing doing!!")
                 end 
                  touch_point_hash = create_selection_hash_action(selection)
                  clear_drop_center 
                  display_touch_point_index_results(selection, touch_point_hash)
                  entry_menu(entry, full = false)
                when 3
                  clear_drop_center
                  display_last_ten_entry_touch_points_title  
                  drop_n_lines(1)
                  display_entry_tps(last_n_descending(10, entry))
                  drop_n_lines(1)
                  entry_menu(entry, full = false)
                when 5
                  clear_drop_center
                  drop_n_lines(1)
                  display_entry_tps(all_descending(entry.touch_points))
                  drop_n_lines(1)
                  entry_menu(entry, full = false)
                when 6 
                  open_file("#{entry.last_name}_#{entry.first_name[0..3]}")
                  entry_menu(entry)
              when 7
                  edit(entry)   
                  @database.save_update(entry)
                  refresh_database_instance
                  entry_menu(entry)  
              when 8
                create_date = touch_point_create_date_action
                if create_date < Time.new(1692,1,1) || create_date == nil
                  center_text("That date doesn't seem right, try again", 5)
                  create_date = touch_point_create_date_action
                end 
                activity = touch_point_create_activity_action
                @database.create_touch_point(entry, create_date, activity)
                refresh_database_instance
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

        # should move these to menu_methods_module

        def entry_last_ten_descending(entry)
            entry.touch_points.last(10)
        end 

        def last_ten_touch_points(entry)
            display_entry_tps(last_n_descending(10, entry))
        end 

         def from_today_descending
            display(from_today)
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
              puts "NEW phone number / FOCUS"
              phone_number = gets.chomp
              entry.phone_number = phone_number
            when 4
              puts "NEW email / TOOLS & MATERIALS"
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
                  @database.delete_touch_point(entry, entry.touch_points[delete_tp])
                  @database.save_update(entry)
                  refresh_database_instance
            when 9
              puts "Are you sure?"
              response = gets.chomp
              if response.downcase.include?("y")
                  @database.save_update(entry, true) 
                  refresh_database_instance
                  main_menu
              else
                 entry_menu(entry)
            end
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
            when 2 
                  search = @database.lev_tp_search(select_keyword_action)
                  selection = @database.touch_points_index[search]
                if selection == nil 
                    main_menu(true, "Try another search-- nothing doing!!")
                end 
                  touch_point_hash = create_selection_hash_action(selection)
                  clear_drop_center 
                  display_touch_point_index_results(selection, touch_point_hash)
            when 3
              full_display(all_descending)
            when 5
              full_display(from_today)
            when 6 
              clear_drop_center
              full_display(the_future)
            when 7
                clear_drop_center
                drop_n_lines
                display(last_n_descending(10))
            when 8
                clear_drop_center
                drop_n_lines
                display(last_n_descending(20))
              when 9
                  search = @database.lev_acc_search(select_keyword_action)
                  selection = @database.accounts_index[search]
                  accounts_hash = create_selection_hash_action(selection)
                    if selection == nil || accounts_hash.empty?
                    main_menu(true, "<<<<<<<<<   Try another search, my friend   >>>>>>>")
                  else 
                    display_account(selection, accounts_hash)
                  end 
            else
              main_menu
            end
            drop_n_lines(3)
            touch_points_menu(false)
          end

end 

      

     
