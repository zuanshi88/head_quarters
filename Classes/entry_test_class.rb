class EntryTest 

    attr_reader :first_name, :last_name, :name 

    def initialize(hash)
        @first_name = hash["first_name"]
        @last_name = hash["last_name"]
        @name = "#{@first_name} #{@last_name}"
    end 

end 