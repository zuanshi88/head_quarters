require_relative "Classes/session"


class Address_Book  


    attr_reader :session, :status

    def initialize(status)
        @status = status
        @session = Session.new(@status)
         if @status 
            @session.main_menu
        end 
    end 

end 

# Address_Book.new(true)

