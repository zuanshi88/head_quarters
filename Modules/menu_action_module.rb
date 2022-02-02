module Menu_Action 


        #prompts for info and returns a hash    
    def add_entry_action
        #this method collects all info via menu prompts
        #then passes info on to save entry
        center_text("first name:", 15)
        first_name = gets.chomp
        puts "last name:"
        last_name = gets.chomp
        "street address:"
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

        # only knows it is getting an array 
    def create_selection_hash_action(selection)
        begin
        if selection.nil?
            nil 
        else
            account_hash = {}
            selection.each_with_index{|acc, index| account_hash[index] = acc}
            return account_hash
        end
        rescue => error  
            puts "You wrote a bad, bad song!"
            puts error.message
            exit
        end
    end 

    def add_touch_point_action
            puts "Date? \#,\#,\# (year, month, day)"
            response = gets.chomp
            begin
                if response.include?("n")
                    create_date = Time.now
                elsif

                        #02/02/2022--this is a big problem here-- how do we sanitize a date
                        # from user input

                    info= response.split(',').map{|item|item.to_i} 
                    if info[0].size == 4
                        new_time = Time.mktime(info[0], info[1],info[2])
                        create_date = new_time
                    else  
                         puts "Did you lead with a 4 digit year"
                        add_touch_point 
                    end 
                end
                rescue
                    puts "Did you put the year first?"
                    add_touch_point    
                end
            return create_date
    end


end 