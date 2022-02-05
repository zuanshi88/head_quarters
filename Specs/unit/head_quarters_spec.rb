require '../Classes/head_quarters'




require 'test/unit'

TEST_DATABASE = './a_read_test_database.txt'

class Test_Head_Quarters < Test::Unit::TestCase

    def setup 
        @head_quarters = Head_Quarters.new(TEST_DATABASE)
    end 

    def test_head_quarters_has_class 
        assert_equal(Head_Quarters, @head_quarters.class)
    end 

    
    def test_head_quarters_has_database_array 
        assert_equal(Directory, @head_quarters.database.class)
    end 

    def test_head_quarters_has_array_of_touch_points 
        assert_equal(Array, @head_quarters.touch_points.class)
    end 



end 