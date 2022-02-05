require '../Classes/head_quarters'
require '../Classes/word_index_class'
require '../Classes/directory_class'
require '../Classes/entry_class'
require '../Classes/touch_point_class'


require '../Modules/menu_module'
require '../Modules/formatting_module'
require 'test/unit'

TEST_DATABASE = './a_read_test_database.txt'

class Test_Head_Quarters < Test::Unit::TestCase

    def setup 
        @head_quarters = Head_Quarters.new(TEST_DATABASE)
        @entry = Entry.new({"first name" => "Aaron", "last name" => "Whitmer", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
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

    def test_head_quarters_can_create_word_index 
        assert_equal(Hash, @head_quarters.accounts_index.class)
    end 


end 