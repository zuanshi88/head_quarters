
require '../Classes/touch_point_class'
require 'test/unit'


class TestTouchPoint < Test::Unit::TestCase 

    def setup 
        @touch_point = Touch_Point.new("aaron", Time.now)
    end 

    def test_has_class 
        assert_equal("Touch_Point", @touch_point.class)
    end

end 