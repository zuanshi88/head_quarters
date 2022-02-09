require_relative 'directory_class'
require_relative 'entry_class'
require_relative 'touch_point_class'
require '../Modules/menu_module'
require '../Modules/formatting_module'



class Session 
  
    include Menu 
    include Formatting 

    attr_reader :touch_points
    attr_accessor :database 

    # decouple @touch_points from headquarters-- just make it travel wtih directory
    # headquarters doesn't care how database keeps track of the touch_points or even 
    # what they are. they just want to know that the touch_points are going to be ready
    # to serve up when needed. 

    #also, extract the WordIndex and just create it when it is called 
    # so that it is using the most upto date information



    def initialize(status)
      @status = status
      @database = Directory.new(status)
      @touch_points = @database.create_tps
    end

    # since this is basically just like the initialize method
    #decided to bring it back here. 
    # it has all the same coupling as the initialize method, but
    #at least they are cordoned off together in the main file.
    def refresh_database
      @database = Directory.new(@status)
      @touch_points = @database.create_tps
    end 

    def save_update(entry, delete)
      @database = save_update(entry, delete)
      @database = Directory.new(@status)
    end 

    def create_touch_point(entry, create_date, activity)
      Directory.create_touch_point(entry, create_date, activity)
    end 
    
  end 




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