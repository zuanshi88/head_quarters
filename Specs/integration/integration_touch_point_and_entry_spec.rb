require 'test/unit'
require '../Classes/entry_class'
require '../Classes/touch_point_class'


class TestEntryAndTouchPoint < Test::Unit::TestCase

    def setup
        @entry = Entry.new({"first name" => "Aaron", "last name" => "Whitmer", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        @touch_point = Touch_Point.new("00000001", "Aaron", Time.now, "Played Euchre")
    end 

    def test_entry_has_class
        assert_equal(Entry, @entry.class)
    end 

    def test_touch_point_has_class
        assert_equal(Touch_Point, @touch_point.class)
    end 
end 





