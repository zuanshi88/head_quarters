module Marshaled_Database

 def save_update(entry)
        database.accounts.delete(entry)
        updated_database = database.accounts.push(entry)
        marshal_save(updated_database, ENTRIES)
        puts "#{entry.name}: updated"
      end

end 