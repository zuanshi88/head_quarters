
require_relative 'address_book_module'
require_relative 'directory'
require_relative 'word_index'
require_relative 'Entry_Class'
require_relative 'Touch_Point_Class'
require_relative 'menu_module'

#marhaled database
ENTRIES = "backup_entries_5.txt"

class Session
  
  include Address_book_module
  include Menu 

  attr_reader :database, :touch_points

  def initialize
    @database = Directory.new(ENTRIES)
    @touch_points = @database.create_tps
    main_menu
  end

  # this is more about the database


  end 




Session.new

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