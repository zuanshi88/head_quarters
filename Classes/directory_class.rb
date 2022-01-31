
class Directory

  attr_reader :accounts, :accounts_index

  def initialize(file)
    @accounts = File.open(file, "rb"){|from_file| Marshal.load(from_file)}
  end

  #instance variable called by all instances of directories to provide
  #up-to-date touch points 
  def create_tps
    tps = []
      @accounts.each do |entry|
        unless entry.touch_points.empty?
          entry.touch_points.each do |tp|
            tps << tp
          end
        end
      end
      return tps
    end

    # here we couple the main app to the directory class
    # below we also reference the @database_file

    def add_account(entry)
      @database.push(entry)
    end 

    def delete_account(entry)
      @database.delete(entry)
    end
 

     def save_update(entry, delete = false)
      updated_database= if delete 
              database.save_update(entry, true) 
            else 
              database.save_update(entry, false)
            end 
          marshal_save(updated_database, @database_file)
          refresh_database(@database_file)
          puts "#{entry.name}: updated"
    end

# below this line in the private interface of this system


    def marshal_save(obj_array, file)
        File.open(file, "wb"){|f| f.write(Marshal.dump(obj_array))}
    end


  end
