class Tester

    attr_reader :name, :intro 

    def initialize(name)
        @name = name 
        @intro = "This is a #{name} test."
    end 

end 