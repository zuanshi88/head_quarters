require '../Classes/directory_class'
require '../Classes/entry_class'
require '../Classes/touch_point_class.rb'
require 'test/unit'



class TestDirectory < Test::Unit::TestCase 


    # bring in save_update method here so it is easir to test and because that makes sense
    # we can see how coupled the directory already is to all of these other models
    # entry_class, touch_point_class

    def setup 
        file = 'tester_database.txt'
        @directory = Directory.new(file)
        @entry = @directory.accounts[-20]
        @touch_points = @directory.create_tps
    end 


    def test_directory_has_class 
        assert_equal(Directory, @directory.class)
    end 

    def test_accounts_has_class 
        assert_equal(Array, @directory.accounts.class)
    end 

    def test_accounts_length 
        assert_equal(93, @directory.accounts.length)
    end 

    def test_entry_class
        assert_equal(Entry, @entry.class)
    end 

    def test_entry_name 
        assert_equal("Test McTester", @entry.name)
    end 

    def test_create_tps 
         assert_equal(Array,@touch_points.class)
    end 

    def test_touch_point_length 
        assert_equal(423, @touch_points.length)
    end 

    # #add_account 

    def test_can_add_account 
        @directory.add_account(@entry)
        assert_equal(94, @directory.accounts.length)
    end 

    # #delete_account 

    def test_can_delete_account
        @directory.delete_account(@entry) 
        assert_equal(92, @directory.accounts.length)
    end 





end 