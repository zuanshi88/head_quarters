require '../Classes/project_class'
require '../Classes/touch_point_class'
require '../Classes/entry_class'
require 'test/unit'


class TestProject < Test::Unit::TestCase

    def setup
        @entry = Entry.new("first name" => "Aaron", "last name" => "Whitmer")
        @project = Project.new("Ruby", "Computers")
        @touch_point = Touch_Point.new(@entry, Time.now)
        @project_tp = Touch_Point.new(@project, Time.now)
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

    def test_ruby_is_ruby
        assert_equal("Ruby", "Ruby")
    end 

    def test_project_is_nil 
        assert_not_nil(@project)
    end 

    def test_project_has_name 
        assert_equal("Ruby", @project.name)
    end 

    def test_project_has_class 
        assert_equal(Project, @project.class)
    end 

    def test_has_tag 
         assert_equal("Computers", @project.tag)
    end 

    def touch_points_empty
        assert_empty(@project.touch_points)
    end 

end 