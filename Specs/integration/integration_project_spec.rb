require 'test/unit'
require './Classes/project_class'
require './Classes/touch_point_class'
require './Classes/entry_class'


class TestProjectIntegration < Test::Unit::TestCase

    def setup
        @entry = Entry.new("first name" => "Aaron", "last name" => "Whitmer")
        @project = Project.new("Ruby", "Computers")
        @touch_point = Touch_Point.new(@entry.object_id, @entry.name, Time.now, "Played disc golf.")
        @project_tp = Touch_Point.new(@project.object_id, @project.name, Time.now, "Ate delicious food.")
    end 

    def test_entry_has_first_name 
        assert_equal("Aaron", @entry.first_name)
    end 

    def test_entry_has_last_name 
         assert_equal("Whitmer", @entry.last_name)
    end 
        #this test suggested using name attribute instead of title
        #for projects to be able to ducktype them with the entry class.
    def test_project_tp_composability 
        assert_equal(Touch_Point, @project_tp.class)
    end 

    def test_touch_point_has_entry 
        @project.add_touch_point(@touch_point)
        assert_equal(1, @project.touch_points.size)
    end 

end 