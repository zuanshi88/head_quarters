module Menu_Action 
     def add_entry
        #this method collects all info via menu prompts
        #then passes info on to save entry
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


    def create_selection_hash(selection)
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
end 