module Menu_Action 


        #prompts for info and returns a hash    
    def add_entry_action
        #this method collects all info via menu prompts
        #then passes info on to save entry

        puts "project?"
        response = gets.chomp.downcase 

        if response.include?("y")
            return add_project_action 
        else 
        puts "name:"
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

        return {"first name" => first_name, "last name" => last_name, "address" => address, "phone number" => phone_number, "email" => email, "name" => name, "touch_points" => touch_points}

    end
end 

    def add_project_action 
        puts "project type:"
        project_type = gets.chomp
        puts "project title:"
        project_title = gets.chomp
        puts "project focus"
        project_focus = gets.chomp
        puts "tools and materials"
        tools_and_materials = gets.chomp
        # puts "state:"
        # state = gets.chomp
        # puts "zipcode"
        # zipcode = gets.chomp
        address = {}
        # {"street_address" => project_focus,
        #                 "city" => tools_and_materials,
                        # "state" => state,
                        # "zipcode" => zipcode
                    #   }
        # name = "#{first_name} #{last_name}"

        # puts "phone:"

        # phone_number = gets.chomp.to_s

        # puts "email:"
        # email = gets.chomp.to_s

        touch_points = []

        {"first name" => project_type, "last name" => project_title, "address" => address, "phone number" => project_focus, "email" => tools_and_materials, "name" => '', "touch_points" => touch_points}

    end 

        # only knows it is getting an array 
        def create_selection_hash_action(selection)
            begin
                account_hash = {}
                selection.each_with_index{|acc, index| account_hash[index] = acc}
                 account_hash
            rescue => error  
                puts "You wrote a bad, bad song!"
                puts error.message
            end
        end 

    
        def select_account_action 
            puts "Enter keyword:"
            target = gets.chomp
            return target.downcase
        end 

    def touch_point_create_date_action
            puts "Date? \#,\#,\# (year, month, day) || (f)uture & (p)ast"
            response = gets.chomp
            begin   
                if response.downcase.include?("n")
                   return create_date = Time.now
                elsif response.downcase.include?("f")
                    puts "how many days?"

                    response = gets.chomp 
                
                    return create_date = Time.now + (86400 * response.to_i)
                
                elsif response.downcase.include?("p")
                    puts "how many days?"

                    response = gets.chomp 
                
                    return create_date = Time.now - (86400 * response.to_i)
                      
                
                    else 
                    info = response.split(/[,\/-]/).map{|item|item.to_i} 
                    if info[0].size == 4 && info[1].size >= 1 && info[2].size >= 1
                        create_date = Time.mktime(info[0], info[1],info[2])
                        return create_date
                    else  
                         puts "Did you lead with a 4 digit year-- also you can divide with , / or -"
                        add_touch_point 
                    end 
                end
                rescue
                    puts "Did you put the year first?"
                    add_touch_point    
                end
    end

    def touch_point_create_activity_action
          puts "Activity: "
          activity = gets.chomp
    end 


end 