require '../Classes/directory_class'
require '../Classes/entry_class'
require '../Classes/touch_point_class.rb'
require 'test/unit'



class TestDirectory < Test::Unit::TestCase 

    #set up to read from one file and write to a new file so the tests don't break each time.

    # bring in save_update method here so it is easir to test and because that makes sense
    # we can see how coupled the directory already is to all of these other models
    # entry_class, touch_point_class

    def setup 
        #we are loading our data from the @read_file
        @read_file = 'an_integration_read_database.txt'
        #we are saving the results of our test runs to the @write file
        @write_file = 'write_test_database.txt'
        @directory = Directory.new(@read_file)
        @entry = @directory.accounts[-1]
        @touch_points = @directory.create_tps
    end 


    def test_accounts_has_class 
        assert_equal(Array, @directory.accounts.class)
    end 

    def test_accounts_length 
        assert_equal(146, @directory.accounts.length)
    end 


    # #directory and entry

     def test_entry_class
        assert_equal(Entry, @entry.class)
    end 

    def test_can_add_account 
        @directory.add_account(@entry)
        assert_equal(147, @directory.accounts.length)
    end 

    # #delete_account 

    def test_can_delete_account
        @directory.add_account(@entry)
        @directory.delete_account(@entry) 
        assert_equal(145, @directory.accounts.length)
    end 

    def test_save_update_delete 
        initial_size = @directory.accounts.size
        Directory.save_update(database: @directory, database_file: @write_file, entry: @entry, delete: true)
        resulting_size = @directory.accounts.size 
        assert_equal(initial_size - 1, resulting_size)
    end 

    
    def test_save_update_add 
        entry = Entry.new({"first name" => "Aaron", "last name" => "Whitmer", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        initial_size = @directory.accounts.size
        Directory.save_update(database: @directory, database_file: @write_file, entry: entry, delete: false)
        resulting_size = @directory.accounts.size 
        assert_equal(initial_size + 1, resulting_size)
    end 

    def test_marshal_save 


    end 
    
    def test_create_tps 
         assert_equal(Array, @touch_points.class)
    end 

    def test_touch_point_length 
        assert_equal(430, @touch_points.length)
    end 





end 