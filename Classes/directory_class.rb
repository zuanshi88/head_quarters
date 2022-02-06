
class Directory

  attr_reader :accounts, :accounts_index, :touch_points

  def initialize(file)
    @accounts = File.open(file, "rb"){|from_file| Marshal.load(from_file)}
    @accounts_index = self.index
    @touch_points = create_tps
  end

  #instance variable called by all instances of directories to provide
  #up-to-date touch points 

  #pull instance variable out and pass it to Touchpoints to produce all
  # of its data. Directory can ask for the touch points from touch_points. 
  
   def index
            information = ["name", "last_name", "first_name"]
            index_hash = {}
            self.accounts.cycle(1) do |obj|
            index_hash[obj.name.downcase] = [] if index_hash[obj.name.downcase].nil?
            index_hash[obj.name.downcase].push(obj)
            index_hash[obj.last_name.downcase] = [] if index_hash[obj.last_name.downcase].nil?
            index_hash[obj.last_name.downcase].push(obj)
            index_hash[obj.first_name.downcase] = [] if index_hash[obj.first_name.downcase].nil?
            index_hash[obj.first_name.downcase].push(obj)
            index_hash[obj.city.downcase] = [] if index_hash[obj.city.downcase].nil?
            index_hash[obj.city.downcase].push(obj)
            index_hash[obj.state.downcase] = [] if index_hash[obj.state.downcase].nil?
            index_hash[obj.state.downcase].push(obj)
            end
            index_hash
    end
  
  # make a call over to touch_points perhaps?  
  
  def create_tps
    tps = []
      self.accounts.each do |entry|
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
    def self.save_update(database:, database_file:, entry:, delete: false)
          database.delete_account(entry) 
            if delete == false 
               database.add_account(entry)
            end 
          marshal_save(database.accounts, database_file)
    end

    def self.marshal_save(obj_array, file)
        File.open(file, "wb"){|f| f.write(Marshal.dump(obj_array))}
    end


    def add_account(entry)
      self.accounts.push(entry)
    end 

    def delete_account(entry)
      self.accounts.delete(entry)
      self.accounts
    end


  end
