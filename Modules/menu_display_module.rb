module Menu_Display 


    #center_text calls are a dependency to the formatting module

                def display_main_menu

                    ["   ==== === =   === === ===== = ======= ==== === ===== === == ==== = == ==",
                    "  ===  ==== ==== ===== === ==== ADDRESS BOOK 7 == = == == === =========== =====",
                    "   == ==== ===== ===== ==== === ==== == ===== ========= ===== ===== === ===== == =",
                    "          add (1) |  points (3) | contacts (6) | open (7) | exit (*)",
                    "  == == === = == ===== ======= ======== == == ==== ===== ============= === = ====",
                    "    ======== =============== ======== = = ====== ===== == ======== ========== ==",
                    "  === ===== == = = = ===== === ===== === == == = == ===== == === === === =="].each do |line| 
                            
                            center_text(line, 50) 
                    end
                end 

                def display_entry_menu
                
                    ["=== === ===== = ======= ==== === ===== === == ==== = == ==",
                    "   = = = == === = = = == = == =  === = === === ===== ==",
                    "  edit (1) | last_ten (5) | add (8) | entry menu (9) | main menu (*)",
                    "  === == ==  = = =  = = = ==== === = = = = = = = = = == ",
                    " === === ===== = ======= ==== === ===== === == ==== = == =="].each do |line|

                           center_text(line, 50) 
                    end 
                end 

                
                def display_edit_menu

                    ["     === ===  === == === === ===== = ======= ==== === ===== === == ==== = == == == === == =====",
                    "   == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = ==   = = ==== = ===",
                    "  === == = == =  == =  === = = = = === = = =  ===  === =  == = =  === = = === = = ===== == = ===",
                    "   name (1) | address (2) | phone (3) | email (4) | touch points (6) | delete (0) | entry menu (*)",
                    "== = = = =  == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = == == = =",
                    "  = = == = ==  = = = == =  == =  === = = = = === = = =  ===  === =  == = =  === = =  = = "].each do |line| 

                        center_text(line, 50)
                    end 
                end 

                def display_touch_point_menu
                    
                    menu = ["   ==== === =   === === ===== = ======= ==== === ===== === == ==== = == ==",
                    "  ===  ==== ==== ===== === ==== TOUCH POINTS == = == == === =========== =====",
                    "    =  ==  ===== == ======= === ==== == ===== ========= ===== ===== ======= =",
                    "     all (3) | current (5) | future (7) | last_ten (9) | main_menu (*)",
                    "   = = == ========= =========== == == ==== ============= ===== === = ====",
                    "   ======== =============== ======== = = ====== ===== == ======== ========== =="].each do |line|

                        center_text(line, 50)
                    end 
                end 

                 def display_last_ten_entry_touch_points_title
                    
                    ["Last Ten Touch Points:",
                    "______________________",].each do |line|

                         center_text(line, 25) 
                    end 
                end 

                def display_last_ten(last_ten_tps)
                    last_ten_tps do |tp| 
                        center_text("#{tp.date}:  #{tp.activity}", 25)
                    end 
                end 

end 