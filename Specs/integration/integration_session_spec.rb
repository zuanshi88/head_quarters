require '../Classes/session.rb'

require 'test/unit'


class TestSession < Test::Unit::TestCase

    def setup 
        @session = Session.new(true)
        @entry = Entry.new({"first name" => "Zevron", "last name" => "Catmer", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})

    end 

    def test_session_has_class 
        assert_equal(Session, @session.class)
    end 

    def test_session_has_database_with_directory_class
        assert_equal(Directory, @session.database.class)
    end 

    def test_session_has_array_of_touch_points 
        assert_equal(Array, @session.database.touch_points.class)
    end 

    def test_can_delete_an_entry 
        size = @session.database.accounts.size
        entry = @session.database[-1]
        @session.save_update(@entry, delete = true)
        assert_equal(size - 1, @session.database.accounts.size)
    end 
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


