require '../Classes/directory_class'
require '../Classes/entry_class'
require '../Classes/touch_point_class.rb'
require 'test/unit'



class TestDirectory < Test::Unit::TestCase 

    def setup 
        file = 'tester_database.txt'
        @directory = Directory.new(file)
        @accounts = @directory.accounts
        @entry = @accounts[-1]
    end 


    def test_directory_has_class 
        assert_equal(Directory, @directory.class)
    end 

    def test_accounts_has_class 
        assert_equal(Array, @accounts.class)
    end 

    def test_accounts_length 
        assert_equal(93, @accounts.length)
    end 

    def test_entry_class
        assert_equal(Entry, @entry.class)
    end 

    #create_tps 


    #add_account 

    #delete_account 





end 