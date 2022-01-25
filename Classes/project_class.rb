class Project 

    attr_reader :name, :tag, :touch_points 

    def initialize(name, tag)
        @name = name
        @tag = tag 
        @touch_points = []
    end 

    def add_touch_point(tp)
        @touch_points << tp 
    end 

end 