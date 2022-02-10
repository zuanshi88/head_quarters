require '../Classes/session.rb'

require 'test/unit'


class TestSession < Test::Unit::TestCase

    def setup 
        @session = Session.new
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

    def test_create_touch_point 
        entry_size = @entry.touch_points.size 
        size = @session.database.touch_points.size
        @session.database.create_touch_point(@entry, Time.now, "Computing is the shit")
        @session.refresh_database_instance
        entry = @session.database.accounts.select{|acc| acc.name == @entry.name}
        assert_equal("", entry.first.name)
        assert_equal(entry_size, 111)
        assert_equal(size + 1, @session.database.touch_points.size )
    end     

    def test_delete_touch_point 
        #create_entry
        #create touch_point 
        #add_another_tp
        #delete_tp 
        #delete entry

        entry = Entry.new({"first name" => "#{rand(1000)}", "last name" => "#{rand(1000)}", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        
        
        @session.refresh_database_instance

        size = @session.database.touch_points.size
        num_of_accounts = @session.database.accounts.size 
        assert_equal(size, @session.database.touch_points.size)
        @session.database.create_touch_point(entry, Time.now, "Computing is the shit")
        @session.refresh_database_instance
        @session.database.create_touch_point(entry, Time.now, "Computing is the shit")
        @session.refresh_database_instance
        @session.database.create_touch_point(entry, Time.now, "Computing is the shit")
        @session.refresh_database_instance
        # now is registering that one and only one new account has been created!
        assert_equal(num_of_accounts + 1, @session.database.accounts.size)
        # also now registering that 3 tps are being created.
        assert_equal(size + 3, @session.database.touch_points.size)

        num_of_accounts = @session.database.accounts.size 
        num_of_tps = @session.database.touch_points.size
        # @session.database.delete_touch_point(@entry, @entry.touch_points[0])
        # assert_equal(entry_size - 1, @entry.touch_points.size )
        @session.refresh_database_instance
        assert_equal(num_of_tps, @session.database.touch_points.size )
        assert_equal(num_of_accounts, @session.database.accounts.size)
    end 




    def test_can_delete_an_entry_with_save_update
        size =  @session.database.accounts.size
        entry = Entry.new({"first name" => "#{rand(1000)}", "last name" => "#{rand(1000)}", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        @session.database.save_update(entry, false)
        # @session.refresh_database_instance
        assert_equal(size + 1, @session.database.accounts.size)
        new_size = @session.database.accounts.size
        @session.database.save_update(entry, true)
        # @session.refresh_database_instance
        assert_equal(new_size - 1, @session.database.accounts.size)
        assert_equal(new_size, size + 1)
        assert_equal(size, @session.database.accounts.size)
    end

     def test_can_add_an_entry_with_save_update 
        entry = Entry.new({"first name" => "#{rand(1000)}", "last name" => "#{rand(1000)}", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        size = @session.database.accounts.size
        @session.database.save_update(entry, false)
        assert_equal(size + 1, @session.database.accounts.size)
    end

end 



