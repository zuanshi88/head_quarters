require_relative 'directory_class'
require_relative 'entry_class'
require_relative 'touch_point_class'
require './Modules/menu_module'
require './Modules/formatting_module'




class Session 
  
    include Menu 
    include Formatting 

    attr_accessor :database, :status



    def initialize(status)
      @status = status
      @time_clock = nil
      @database = Directory.new(@status)
         if @status 
            self.main_menu
        end 
    end


    def refresh_database_instance 
      @database = Directory.new(@status)
    end 
    
  end 


