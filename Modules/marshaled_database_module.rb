module Marshaled_Database

 def save_update(entry)
        database.accounts.delete(entry)
        updated_database = database.accounts.push(entry)
        marshal_save(updated_database, ENTRIES)
        puts "#{entry.name}: updated"
      end


   def marshal_save(obj_array, file)
        File.open(file, "wb"){|f| f.write(Marshal.dump(obj_array))}
  end


end 