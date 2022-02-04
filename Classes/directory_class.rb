
class Directory

  attr_reader :accounts, :accounts_index

  def initialize(file)
    @accounts = File.open(file, "rb"){|from_file| Marshal.load(from_file)}
  end

  #instance variable called by all instances of directories to provide
  #up-to-date touch points 

  #pull instance variable out and pass it to Touchpoints to produce all
  # of its data. Directory can ask for the touch points from touch_points. 
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

       # here we are connecting directory to head_quarters using the 
       # head_quarters @database instance variable which connects
       #this instance of directory with this instance of headquarters. 
       #here we are using a global method to encapsulate calls to 
       #instance methods
    def self.save_update(database:, database_file:, delete: false, entry:)
          database.delete_account(entry) 
            if delete == false 
               database.add_account(entry)
            end 
          Directory.marshal_save(database.accounts, database_file)
    end

    def self.marshal_save(obj_array, file)
        File.open(file, "wb"){|f| f.write(Marshal.dump(obj_array))}
    end


    def add_account(entry)
      @accounts.push(entry)
    end 

    def delete_account(entry)
      @accounts.delete(entry)
      @accounts
    end


  end
