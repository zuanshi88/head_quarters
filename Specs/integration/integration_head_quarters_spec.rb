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


    

    #  attr_reader :database, :touch_points, :accounts_index

# def refresh_database
#       @database = Directory.new(@database_file)
#       @touch_points = @database.create_tps
#       @accounts_index = WordIndex.new(@database.accounts).index
#     end 

#     def save_update(entry)
#       Directory.save_update(database: @database, database_file: @database_file, entry: entry)
#     end 

#     def create_touch_point(entry)
#       create_date = touch_point_create_date_action
#       activity = touch_point_create_activity_action
#       entry.touch_points << Touch_Point.new(entry.object_id, entry.name, create_date, activity)
#     end 


end 