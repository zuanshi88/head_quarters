module Menu_Display 


    #center_text calls are a dependency to the formatting module

    # DIS_NOT_FOUND = "      <<<<<<   try another selection #{selection} could not be located   >>>>>>"

                # def display_not_found(input)
                #     "      <<<<<<   try another selection #{input} could not be fuckin located   >>>>>>"
                # end 

                def display_main_menu

                    ["--------------------------------------------------------------------------------",
                    "--------------------------------------------------------------------------------",
                    "--------------------------------  Head Quarters   ------------------------------",
                    "--------------------------------------------------------------------------------",
                    "---------   add (3) |  points (4) | contacts (8) | open (9) | exit (*)   -------",
                    "--------------------------------------------------------------------------------",
                    "--------------------------------------------------------------------------------",
                    "--------------------------------------------------------------------------------"].each do |line| 
                            
                            center_text(line, 50) 
                    end
                end 

                def display_entry_menu
                
                    ["------------------------------------------------------------------------",
                    "------------------------------------------------------------------------",
                    "  edit (3) | last_ten (4) | add (8) | entry menu (9) | main menu (*)",
                    "------------------------------------------------------------------------",
                    "------------------------------------------------------------------------"].each do |line|

                           center_text(line, 50) 
                    end 
                end 

                
                def display_edit_menu

                    ["   == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = ==   = = ==== = ===",
                    "  === == = == =  == =  === = = = = === = = =  ===  === =  == = =  === = = === = = ===== == = ===",
                    "   name (1) | address (2) | phone (3) | email (4) | touch points (8) | delete (9) | entry menu (*)",
                    "== = = = =  == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = == == = =",
                    "  = = == = ==  = = = == =  == =  === = = = = === = = =  ===  === =  == = =  === = =  = = "].each do |line| 

                        center_text(line, 50)
                    end 
                end 

                def display_touch_point_menu
                    
                    menu = ["------------------------------------------------------------------------------",
                    "------------------------------------------------------------------------------",
                    "------------------------------------------------------------------------------",
                    "    all (3) | current (5) | future (7) | last_ten (8) | open (9) | main_menu (*)",
                    "------------------------------------------------------------------------------",
                    "------------------------------------------------------------------------------"].each do |line|

                        center_text(line, 50)
                    end 
                end 

                 def display_last_ten_entry_touch_points_title
                    
                    ["Last Ten Touch Points:",
                    "______________________",].each do |line|

                         center_text(line, 62) 
                    end 
                end 

                def display_entry_tps(tps)
                    tps.each do |tp| 
                        center_text("#{tp.date}:  #{tp.activity}", 50)
                    end 
                end 

                def display_last_ten_combined 
                    #formatting_module
                    #menu_display_module  
                end 

                def display(tps)
                    tps.each do |tp|
                        title = tp.account_name.split(/ /)[1]
                        center_text("#{tp.date}  #{title}:", 48, new_line = false)
                        center_text("--   #{tp.activity[0..75]} #{tp.activity.size > 75 ? "..." : ""}", 10 - title.size)
                    end 
                end 
                
                def full_display(tps)
                    tps.each{|tp| puts "#{tp.date}: #{tp.account_name} (#{tp.activity})"}
                end 

            
end 