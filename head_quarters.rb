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
      @database_file = file
      @database = Directory.new(file)
      @touch_points = @database.create_tps
      @accounts_index = WordIndex.new(@database.accounts).index
      main_menu
    end

    # since this is basically just like the initialize method
    #decided to bring it back here. 
    # it has all the same coupling as the initialize method, but
    #at least they are cordoned off together in the main file.
    def refresh_database
      @database = Directory.new(@database_file)
      @touch_points = @database.create_tps
      @accounts_index = WordIndex.new(@database.accounts).index
    end 

    def save_update(entry)
      Directory.save_update(database: @database, database_file: @database_file, entry: entry, delete:)
    end 

    def create_touch_point(entry)
      create_date = touch_point_create_date_action
      activity = touch_point_create_activity_action
      entry.touch_points << Touch_Point.new(entry, create_date, activity)
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