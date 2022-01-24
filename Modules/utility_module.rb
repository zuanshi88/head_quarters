require_relative 'marshaled_database_module'

module Utility 

    include Marshaled_Database



  def add_touch_point(entry)
      puts "Date? \#,\#,\# (year, month, day)"
      response = gets.chomp
      begin
        if response.include?("n")
          create_date = Time.now
        else
            match_set = response.scan(/(\d+)/)
            info = match_set.map{|int| int[0].to_i}
            new_time = Time.mktime(info[0], info[1],info[2])
            create_date = new_time
        end
        rescue
            puts "Did you put the year first?"
            add_touch_point(entry)
          else
          tp = Touch_Point.new(entry, create_date)
          entry.touch_points << tp
          save_update(entry)
          system('cls')
          display_contact(entry)
          entry_menu(entry)
      end
  end




end 