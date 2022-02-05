require '../Classes/project_class'
require '../Classes/touch_point_class'
require '../Classes/entry_class'
require 'test/unit'


class TestProject < Test::Unit::TestCase    
    
    def setup
        @entry = Entry.new("first name" => "Aaron", "last name" => "Whitmer")
        @project = Project.new("Ruby", "Computers")
        @touch_point = Touch_Point.new(@entry.object_id, @entry.name, Time.now, "Played disc golf.")
        @project_tp = Touch_Point.new(@project.object_id, @project.name, Time.now, "Ate delicious food.")
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