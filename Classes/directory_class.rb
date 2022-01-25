
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

    def delete_account(entry)
      @accounts.delete(entry)
    end

    def self.save_entry(new_entry, database)
        updated_database = database.push(new_entry)
        updated_database
    end 


  end
