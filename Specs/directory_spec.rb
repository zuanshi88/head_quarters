require '../Classes/directory_class'
require '../Classes/entry_class'
require '../Classes/touch_point_class.rb'
require 'test/unit'



class TestDirectory < Test::Unit::TestCase 


    # bring in save_update method here so it is easir to test and because that makes sense
    # we can see how coupled the directory already is to all of these other models
    # entry_class, touch_point_class

    def setup 
        @read_file = 'tester_database.txt'
        @write_file = 'write_tester.txt'
        @directory = Directory.new(@read_file)
        @entry = @directory.accounts[-1]
        @touch_points = @directory.create_tps
    end 


    def test_directory_has_class 
        assert_equal(Directory, @directory.class)
    end 

    def test_accounts_has_class 
        assert_equal(Array, @directory.accounts.class)
    end 

    def test_accounts_length 
        assert_equal(90, @directory.accounts.length)
    end 

    def test_entry_class
        assert_equal(Entry, @entry.class)
    end 

    # def test_entry_name 
    #     assert_equal("Projects REACT", @entry.name)
    # end 

    def test_create_tps 
         assert_equal(Array, @touch_points.class)
    end 

    def test_touch_point_length 
        assert_equal(415, @touch_points.length)
    end 

    # #add_account 

    def test_can_add_account 
        @directory.add_account(@entry)
        assert_equal(91, @directory.accounts.length)
    end 

    # #delete_account 

    def test_can_delete_account
        @directory.delete_account(@entry) 
        assert_equal(89, @directory.accounts.length)
    end 

    def test_save_update_delete 
        initial_size = @directory.accounts.size
        Directory.save_update(database: @directory, database_file: @write_file, entry: @entry, delete: true)
        resulting_size = @directory.accounts.size 
        assert_equal(initial_size - 1, resulting_size)
    end 

    
    def test_save_update_add 
        initial_size = @directory.accounts.size
        Directory.save_update(database: @directory, database_file: @write_file, entry: @entry, delete: false)
        resulting_size = @directory.accounts.size 
        assert_equal(initial_size + 1, resulting_size)
    end 

    def test_marshal_save 


    end 





end 