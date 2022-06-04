require_relative 'directory_class'
require_relative 'entry_class'
require_relative 'touch_point_class'
require './Modules/menu_module'
require './Modules/formatting_module'




class Session 
  
    include Menu 
    include Formatting 

    attr_accessor :database, :status


#changed at status tp see if this would allow load.
    def initialize(status)
      @status = status
      @time_clock = nil
      @database = Directory.new(@status)
         if @status 
            self.main_menu
        end 
    end

    #here we could pass a boolean value for main_menu
    def refresh_database_instance 
      @database = Directory.new(@status)
    end 
    
  end 



#3/25/2022

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