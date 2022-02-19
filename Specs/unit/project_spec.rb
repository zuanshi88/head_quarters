require '../Classes/project_class'
require '../Classes/touch_point_class'
require '../Classes/entry_class'
require 'test/unit'


class TestProject < Test::Unit::TestCase  
    
    # interface
    #   - mirror new accout 
    #   - open like account 
    #   - touch_points-- mix account/people touch_point with project touch_points 
    # how will this be saved? 

    #NEXT UP -- clean up this spec and then create saom sort of integration test to model
    # creating projects and adding touch points to them, and then set up the interface.
    # then we will have a really clean bulleted time line of people and projects.
    
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

    def test_touch_points_empty
        assert_empty(@project.touch_points)
    end 

    def test_can_create_touch_point

    end 

end 