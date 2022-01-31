require './Classes/directory_class'
require './Classes/word_index_class'
require './Classes/entry_class'
require './Classes/touch_point_class'

require './Modules/menu_module'
require './Modules/formatting_module'


#marshaled database
ENTRIES = "marshaled_database.txt"

class Head_Quarters
  
    include Menu 
    include Formatting 

    attr_reader :database, :touch_points, :accounts_index

    def initialize(file)
      # @directory_file = file
      @database = Directory.new(file)
      @touch_points = @database.create_tps
      @accounts_index = WordIndex.new(@database.accounts).index
      main_menu
    end

    
    def save_update(entry)
                database.delete_account(entry)
                updated_database = database.accounts.push(entry)
                marshal_save(updated_database, ENTRIES)
                refresh_database(ENTRIES)
                puts "#{entry.name}: updated"
    end

# below this line in the private interface of this system


    def marshal_save(obj_array, file)
            File.open(file, "wb"){|f| f.write(Marshal.dump(obj_array))}
    end

      # caught bug here-- needed to refresh all the main points.
    def refresh_database(file)
      @database = Directory.new(file)
      @touch_points = @database.create_tps
      @accounts_index = WordIndex.new(@database.accounts).index
    end 


  end 

Head_Quarters.new(ENTRIES)

#TO DO list
# clean up code, get better with comments.
#prompt for missing info
#using ^for searching/open
#search, add, remove (check for duplicates)
#foreign address handler?
#code to stop repeats
#add time stamp and a sort by date function
#list all enties alphabetically...
#add touch_points

#12/16/2020: Make a new menu to display different views of directory_hash
#alphbetic, last contact, etc,

#12/19/2020:  Working on full integrating the ENTRY OBJECT into the design.
#             Should have started with this approach from the beginning,
# =>          But did not know this apprach-- it has been a learning process!
# =>          But very good I think!!

#12/19/2020: Stuck trying to clean up the touch_point mess
# =>        learning why design saves time.
# =>        stuck in ab_sketchbook_5 on creating an array of symbols...


#12/24/2020:
# => touch point object2
# => display object

#04/17/2021
# => have added Marshalling and index

#01/22/2022 
# => back refactoring codebase with gusto. Utilizing git
#    with a lot more ease. Wanting to use it. Thinking 
#    more about testing.  Writing tests for this system 
#    would be a great bridge to cross as well. 