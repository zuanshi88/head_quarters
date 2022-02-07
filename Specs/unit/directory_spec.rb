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
    
        #we are saving the results of our test runs to the @write file
    
        @directory = Directory.new(true)
        @entry = @directory.accounts[-1]
        @touch_points = @directory.create_tps
        @database_file = @directory.database_file
    end 

    def test_directory_has_database_file_with_correct_class 
        assert_equal("../Specs/a_read_test_database.txt", @database_file)
    end 

    def test_directory_has_database_file 
        assert_equal(true, @directory.status)
    end 


    def test_directory_has_class 
        assert_equal(Directory, @directory.class)
    end 


    def test_directory_accounts_index_class
        assert_equal(Hash, @directory.accounts_index.class)
    end 

    def test_directory_index_size 
         assert_equal(275, @directory.accounts_index.size)
    end 

    def test_directory_accounts_index_retrieves_array_of_multiple_matches
        assert_equal(Array, @directory.accounts_index["birkey"].class)
    end 

    def test_directory_accounts_index_retrieves_single_match
        assert_equal(Entry, @directory.accounts_index["annette"][0].class)
    end 

    def test_directory_accounts_index_retrieves_single_match_in_single_item_array
        assert_equal(1, @directory.accounts_index["annette"].size)
    end 

    def test_directory_accounts_index_retrieves_entry_match
        assert_equal("Summersett", @directory.accounts_index["annette"][0].last_name)
    end 


    def test_directory_accounts_index_retrieves_value
        assert_equal(Entry, @directory.accounts_index["latham"][0].class)
    end 

    def test_directory_index_can_search_cities 
        assert_equal(4, @directory.accounts_index["portland"].size)
    end 

    def test_directory_index_can_access_first_search_return
        assert_equal(Entry, @directory.accounts_index["portland"][0].class)
    end 

    def test_directory_has_touch_points  
        assert_equal(Array, @directory.touch_points.class)
    end 

    def test_directory_touch_points_size 
        assert_equal(430, @directory.touch_points.size)
    end 


    


    # def test_accounts_has_class 
    #     assert_equal(Array, @directory.accounts.class)
    # end 

    # def test_accounts_length 
    #     assert_equal(96, @directory.accounts.length)
    # end 

    # def test_entry_class
    #     assert_equal(Entry, @entry.class)
    # end 

    # def test_create_tps 
    #      assert_equal(Array, @touch_points.class)
    # end 

    # def test_touch_point_length 
    #     assert_equal(430, @touch_points.length)
    # end 

    # # #add_account 

    # def test_can_add_account 
    #     @directory.add_account(@entry)
    #     assert_equal(97, @directory.accounts.length)
    # end 

    # # #delete_account 

    # def test_can_delete_account
    #     @directory.add_account(@entry)
    #     @directory.delete_account(@entry) 
    #     assert_equal(95, @directory.accounts.length)
    # end 

    # def test_save_update_delete 
    #     initial_size = @directory.accounts.size
    #     Directory.save_update(database: @directory, database_file: @write_file, entry: @entry, delete: true)
    #     resulting_size = @directory.accounts.size 
    #     assert_equal(initial_size - 1, resulting_size)
    # end 

    
    # def test_save_update_add 
    #     entry = Entry.new({"first name" => "Aaron", "last name" => "Whitmer", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
    #     initial_size = @directory.accounts.size
    #     Directory.save_update(database: @directory, database_file: @write_file, entry: entry, delete: false)
    #     resulting_size = @directory.accounts.size 
    #     assert_equal(initial_size + 1, resulting_size)
    # end 

    # def test_marshal_save 


    # end 





end 