
require './Classes/touch_point_class'
require 'test/unit'


class TestTouchPoint < Test::Unit::TestCase 

    def setup 
        @touch_point = Touch_Point.new("00000001", "Aaron", Time.now, "Played Euchre")
    end 

    def test_has_date_obj 
        assert_equal(Time, @touch_point.date_obj.class)
    end 

    def test_date_is_a_string 
        assert_equal(String, @touch_point.date.class)
    end  

    
    def test_date_is_correct
        assert_equal(Time.now().strftime("%m/%d/%Y"), @touch_point.date)
    end  

    def 

    def test_has_class 
        assert_equal(Touch_Point, @touch_point.class)
    end

    def test_has_id_from_account 
        assert_equal("00000001", @touch_point.account)
    end 

    def test_has_name_from_account_name
        assert_equal("Aaron", @touch_point.account_name)
    end 

    def test_has_activity 
        assert_equal("Played Euchre", @touch_point.activity)
    end

end 