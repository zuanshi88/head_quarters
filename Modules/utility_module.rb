require 'time'
module Utility_Module
#should this methods be stored here? or inside SESSION?

# can I access the ENTRIES and convert them to HASHes and put them back?

# takes a file, returns an array of objects


  def drop_center 
    30.times{ puts ""}
  end 

  def center_text(text, new_line = true)
        50.times{ print " "}
      if new_line 
        puts text 
      else 
        print text
      end 
  end 

  #more database types

def marshal_save(obj_array, file)
  File.open(file, "wb"){|f| f.write(Marshal.dump(obj_array))}
end

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

  def open_touch_points(obj)
      obj.touch_points
  end


      def save_update(entry)
        database.accounts.delete(entry)
        updated_database = database.accounts.push(entry)
        marshal_save(updated_database, ENTRIES)
        puts "#{entry.name}: updated"
      end
  end
