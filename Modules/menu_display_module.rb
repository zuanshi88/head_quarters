module Menu_Display 


    #center_text calls are a dependency to the formatting module

    # DIS_NOT_FOUND = "      <<<<<<   try another selection #{selection} could not be located   >>>>>>"

                # def display_not_found(input)
                #     "      <<<<<<   try another selection #{input} could not be fuckin located   >>>>>>"
                # end 

                def display_main_menu

                    
                    ["================================================================================",
                    "---------------------------------------------------------------------------------",
                    "--------]============================[ HQ ]============================[--------",
                    "-----=====-------===--------======-------========-------====-------====----------",
                    "   index (2) | add (3) |  pts (4) | tc (6) | contacts (8) | open (9) | exit (*)",
                    "-----=====-------===--------======-------========-------====-------====--------",
                    "================================================================================="].each do |line| 
                            
                            center_text(line) 
                    end
                end 

                def display_entry_menu
                
                    ["-----------------------------------------------------------------------------------------------------------------------------",
                    "=====-------=====-------========-------========-------===-------====-------====-------===-------==========-------=========---",
                    "index (1) | files (2) | new_file (3) | last_ten (4) | all (5) | docx (6) | edit (7) | add (8) | entry_menu (9) | main_menu (*)",
                    "=====-------=====-------========-------========-------===-------====-------====-------===-------==========-------=========---",
                    "------------------------------------------------------------------------------------------------------------------------------"].each do |line|

                           center_text(line) 
                    end 
                end 

                
                def display_edit_menu

                    ["   == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = ==   = = ==== = ===== =   ==== = === = == ==  = == =",
                    "  ==  ==  ==  === == = = === =  ==== == = == =  == =  === = = = = === = = =  ===  === =  == = =  === = = === = = ===== == = ===",
                    "   name (1) | address (2) | phone / FOCUS (3) | email / TOOLS & MATERIALS (4) | touch points (8) | delete (9) | entry menu (*)",
                    "== = = = =  == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = == == = = = === = =  == == = = === = == = == = ==",
                    "  = = == = ==  = = = == =  == =  === = = = = === = = =  ===  === =  == = =  === = =  = = == ===== = == === == = == = == = ="].each do |line| 

                        center_text(line)
                    end 
                end 

                def display_touch_point_menu
                    
                    menu = ["------------------------------------------------------------------------------",
                    "---------------=====-------===-------=======-------======---------------------",
                    "-----------    index (2) | all (3) | current (5) | future (6)  ---------------",
                    "-------     == ===== ===   === ====  ======  ====  === == =======    ---------",
                    "---------   last_ten (7) | last_twenty (8) | open (9) | main_menu (*)  -------",
                    "------------========       ===========       ====       =========       ------",
                    "------------------------------------------------------------------------------"].each do |line|

                        center_text(line)
                    end 
                end 

                 def display_last_ten_entry_touch_points_title
                    
                    ["Last Ten Touch Points:",
                    "______________________",].each do |line|

                         center_text(line, 15) 
                    end 
                end 

                def display_entry_tps(tps)
                    tps.each do |tp| 
                        center_text("#{tp.date}:  #{tp.activity}", 15)
                    end 
                end 

                def display_last_ten_combined 
                    #formatting_module
                    #menu_display_module  
                end 

                def display(tps)
                    tps.each do |tp|
                        title = tp.account_name.split(/ /)[-1 ]
                        center_text("#{tp.date}  #{title}:", 15, new_line = false)
                        center_text("--   #{tp.activity[0..75]} #{tp.activity.size > 75 ? "..." : ""}", 10 - title.size)
                    end 
                end 
                
                def full_display(tps)
                    tps.each{|tp| puts "#{tp.date}: #{tp.account_name} (#{tp.activity})"}
                end 

                  def display_account(selection, account_hash) 
                        # head_quarters
                            if selection == nil || account_hash == nil 
                                main_menu(true, "      <<<<<<   try another selection   >>>>>>")
                            elsif  account_hash.length == 1
                                open_contact(account_hash[0])   
                            else 
                                account_hash.keys.each{|key| center_text("#{key}: #{account_hash[key].last_name} -- #{account_hash[key].first_name} ", 38); puts ""}
                                selection = gets.chomp
                                open_contact(account_hash[selection.to_i])
                            end 
                    end 



                    def display_touch_point_index_results(selection, touch_points_index_hash)
                            if selection == nil || touch_points_index_hash == nil 
                                main_menu(true, "      <<<<<<   try another selection   >>>>>>")
                            else 
                                touch_points_index_hash.values.uniq.sort_by{|value| value.date_obj}.reverse.each{|v| center_text("#{v.date}: #{v.account_name} : #{v.activity}", 15); puts ""}
                            end 
                    end 

                def display_time_clock 
                     ["----------------------------------------",                     
                     "       IN (3) | OUT (4) | EXIT (other)                                   ",
                     "-----------------------------------------",
                     "                                         "].each do |line|

                           center_text(line) 
                    end 
                end 


                def display_all_accounts(accounts)
                        #this is all pushed way over for easier reading upon display
                        
                            drop_n_lines(2)
                    
                        accounts.sort_by{|obj| obj.last_name.downcase}.each do |entry|
                                drop_n_lines
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
                        drop_n_lines
                        [["=================", true], ["  " + obj.name, true],["=================", true], 
                        [obj.street_address, true], 
                        [obj.city, false]].each do |info, status|
                            center_text(info, 25, status)
                        end 

                        print " " + obj.state + " " + obj.zipcode 
                        drop_n_lines

                        [[obj.phone_number, true], [obj.email, true]].each do |info, status| 
                            center_text(info, 25, status)
                        end
                            if obj.touch_points.empty?
                            drop_n_lines
                            else
                            drop_n_lines
                            # this is where we can cap the tp display of each entry
                            obj.touch_points.sort_by{|tp| tp.date_obj }.last(15).reverse.each do |tp|
                                center_text("#{tp.date}: #{tp.activity}", 15)
                            end 
                            end
                            
                            drop_n_lines(2)
                end


                def display_files(file_hash)
                      file_hash.each{|k,v| center_text("#{k}: #{v.type} : #{v.path.split('/').last} -- #{v.path}", 15); puts ""}
                end
            
end 