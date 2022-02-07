require_relative "Classes/head_quarters"
require_relative "Modules/menu_module"
require_relative "Modules/formatting_module"


# ENTRIES = "a_test_marshaled_database.txt"

FILE = "./a_marshaled_database.txt"

class Address_Book  

    include Menu
    include Formatting

    attr_reader :session

    def initialize
        @session = Session.new(FILE) 
        main_menu
    end 

end 

Address_Book.new()

