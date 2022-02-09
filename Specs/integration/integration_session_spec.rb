require '../Classes/session.rb'

require 'test/unit'


class TestSession < Test::Unit::TestCase

    def setup 
        @session = Session.new(false)
        @entry = Entry.new({"first name" => "Zevron", "last name" => "Catmer", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})

    end 

    def test_session_has_class 
        assert_equal(Session, @session.class)
    end 

      def test_session_respond_to_save_update 
        assert_equal(true, @session.database.respond_to?(:save_update))
    end 

    
    def test_session_has_database 
        assert_equal("../Database/a_read_test_database.txt", @session.database.database_file)
    end 

    def test_address_book_has_directory 
        assert_equal(Directory, @session.database.class)
    end 



    def test_session_has_array_of_touch_points 
        assert_equal(Array, @session.database.touch_points.class)
    end 

    def test_can_delete_an_entry_with_save_update
        @session.database.save_update(@entry, false)
        size = @session.database.accounts.size
        @session.database.save_update(@entry, true)
        assert_equal(size - 1, @session.database.accounts.size)
    end

     def test_can_add_an_entry_with_save_update 
        size = @session.database.accounts.size
        @session.database.save_update(@entry, false)
        assert_equal(size + 1, @session.database.accounts.size)
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


