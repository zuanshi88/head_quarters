require './Classes/directory_class'
require './Classes/session'
require './Classes/entry_class'
require './Classes/touch_point_class.rb'
require './Classes/entry_file_class.rb'
require 'test/unit'



class TestDirectoryIntegration < Test::Unit::TestCase 

    #set up to read from one file and write to a new file so the tests don't break each time.

    # bring in save_update method here so it is easir to test and because that makes sense
    # we can see how coupled the directory already is to all of these other models
    # entry_class, touch_point_class

    def setup 
        @read_file = './Database/an_integration_read_database.txt'
        @directory = Directory.new(false)
        @entry = @directory.accounts[-1]
        @entry_with_most_tps = @directory.accounts.sort_by{|entry| entry.touch_points.size}[-1]
        @entry_index = @directory.index_touch_points(@entry_with_most_tps.touch_points)
    end 


    def test_accounts_has_class 
        assert_equal(Array, @directory.accounts.class)
    end 

    def test_accounts_length 
        size = @directory.accounts.length
        assert_operator(200, :<=, @directory.accounts.size)
    end 


    # #directory and entry

     def test_entry_class
        assert_equal(Entry, @entry.class)
    end 

    def test_can_add_account 
        size = @directory.accounts.length
        @directory.add_account(@entry)
        assert_equal(size + 1, @directory.accounts.length)
    end 

    # #delete_account 

    def test_can_delete_account
        size = @directory.accounts.length 
        @directory.delete_account(@entry) 
        assert_equal(size - 1 , @directory.accounts.length)
    end 


    def test_save_update_delete 
        initial_size = @directory.accounts.size
        @directory.save_update(@entry, true)
        resulting_size = @directory.accounts.size 
        assert_equal(initial_size - 1, resulting_size)
    end 

    
    def test_save_update_add 
        entry = Entry.new({"first name" => "#{rand(1000)}", "last name" => "Whitmer", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        initial_size = @directory.accounts.size
        @directory.save_update(entry, false)
        resulting_size = @directory.accounts.size 
        assert_equal(initial_size + 1, resulting_size)
    end 

    def test_marshal_save 


    end 


    def test_touch_point_length 
        size = @directory.accounts.length
        assert_equal(size, @directory.accounts.length)
    end 

    def test_directory_can_index_entry_and_return_a_hash 
        assert_equal(Hash, @entry_index.class)
    end 

    
    def test_entry_has_touch_points 
        assert_operator( 40, :<=, @entry_with_most_tps.touch_points.size)
    end 
    
    def test_entry_index_can_return_a_value 
        assert_operator(200, :<=, @entry_index.size)
    end 

    def test_open_file 

    end 


end 