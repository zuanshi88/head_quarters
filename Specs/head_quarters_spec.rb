require '../head_quarters.rb'
require '../../Classes/directory_class'
require '../Classes/word_index_class'
require '../Classes/entry_class'
require '../Classes/touch_point_class'


require '../Modules/menu_module'
require '../Modules/formatting_module'
require 'test/unit'

TEST_DATABASE = 'test_database.txt'

class Test_Head_Quarters < Test::Unit::TestCase

    def setup 
        @head_quarters = Head_Quarters.new(TEST_DATABASE)
    end 

    def test_head_quarters_has_class 
        assert_equal("Head_Quarters", @headquarters.class)
    end 

end 