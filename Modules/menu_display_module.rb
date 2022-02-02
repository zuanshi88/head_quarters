module Menu_Display 


    #center_text calls are a dependency to the formatting module

                def display_main_menu

                    ["   ==== === =   === === ===== = ======= ==== === ===== === == ==== = == ==",
                    "  ===  ==== ==== ===== === ==== ADDRESS BOOK 7 == = == == === =========== =====",
                    "   == ==== ===== ===== ==== === ==== == ===== ========= ===== ===== === ===== == =",
                    "          add (3) |  points (4) | contacts (8) | open (9) | exit (*)",
                    "  == == === = == ===== ======= ======== == == ==== ===== ============= === = ====",
                    "    ======== =============== ======== = = ====== ===== == ======== ========== ==",
                    "  === ===== == = = = ===== === ===== === == == = == ===== == === === === =="].each do |line| 
                            
                            center_text(line, 50) 
                    end
                end 

                def display_entry_menu
                
                    ["=== === ===== = ======= ==== === ===== === == ==== = == ==",
                    "   = = = == === = = = == = == =  === = === === ===== ==",
                    "  edit (3) | last_ten (4) | add (8) | entry menu (9) | main menu (*)",
                    "  === == ==  = = =  = = = ==== === = = = = = = = = = == ",
                    " === === ===== = ======= ==== === ===== === == ==== = == =="].each do |line|

                           center_text(line, 50) 
                    end 
                end 

                
                def display_edit_menu

                    ["     === ===  === == === === ===== = ======= ==== === ===== === == ==== = == == == === == =====",
                    "   == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = ==   = = ==== = ===",
                    "  === == = == =  == =  === = = = = === = = =  ===  === =  == = =  === = = === = = ===== == = ===",
                    "   name (1) | address (2) | phone (3) | email (4) | touch points (8) | delete (9) | entry menu (*)",
                    "== = = = =  == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = == == = =",
                    "  = = == = ==  = = = == =  == =  === = = = = === = = =  ===  === =  == = =  === = =  = = "].each do |line| 

                        center_text(line, 50)
                    end 
                end 

                def display_touch_point_menu
                    
                    menu = ["   ==== === =   === === ===== = ======= ==== === ===== === == ==== = == ==",
                    "  ===  ==== ==== ===== === ==== TOUCH POINTS == = == == === =========== =====",
                    "    =  ==  ===== == ======= === ==== == ===== ========= ===== ===== ======= =",
                    "    all (3) | current (5) | future (7) | last_ten (8) | open (9) | main_menu (*)",
                    "   = = == ========= =========== == == ==== ============= ===== === = ====",
                    "   ======== =============== ======== = = ====== ===== == ======== ========== =="].each do |line|

                        center_text(line, 50)
                    end 
                end 

                 def display_last_ten_entry_touch_points_title
                    
                    ["Last Ten Touch Points:",
                    "______________________",].each do |line|

                         center_text(line, 62) 
                    end 
                end 

                def display_last_ten(last_ten_tps)
                    last_ten_tps.each do |tp| 
                        center_text("#{tp.date}:  #{tp.activity}", 50)
                    end 
                end 

                def display(tps)
                    tps.each do |tp|
                        title = tp.account_name.split(/ /)[1]
                        center_text("#{tp.date}  #{title}:", 48, new_line = false)
                        center_text("--   #{tp.activity[0..50]} #{tp.activity.size > 50 ? "..." : ""}", 10 - title.size)
                    end 
                end

end 