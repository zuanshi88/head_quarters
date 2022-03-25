require '../Classes/directory_class'
require '../Classes/entry_class'

require 'test/unit'



class TestDirectory < Test::Unit::TestCase 




    def setup 
    # the false parameter creates a testing version of the database
        @directory = Directory.new(false)
        @entry = @directory.accounts[-1]
        @touch_points = @directory.create_tps
        @database_file = @directory.database_file
    end 

    def test_directory_has_class 
        assert_equal(Directory, @directory.class)
        
    end 
    
    def test_directory_has_false_status
        assert_equal(false, @directory.status)
    end

    def test_directory_has_database_file 
        assert_equal("../Database/a_read_test_database.txt", @database_file)
    end 


    def test_directory_accounts_index_class
        assert_equal(Hash, @directory.accounts_index.class)
    end 

    def test_directory_index_size 
        size = @directory.accounts_index.size
         assert_equal(size, @directory.accounts_index.size)
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
        size = @directory.touch_points.size
        assert_equal(size, @directory.touch_points.size)
    end 

    def test_accounts_has_class 
        assert_equal(Array, @directory.accounts.class)
    end 

    def test_accounts_length 
        size = @directory.accounts.length
        assert_equal(size, @directory.accounts.length)
    end 

    def test_can_instantiate_an_entry 
        @new_entry =  Entry.new({"first name" => "Damn", "last name" => "Yankee", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        assert_equal("Damn", @new_entry.first_name)
    end 

    def test_directory_can_create_touch_point 
        @touch_point_entry =  Entry.new({"first name" => "Stan", "last name" => "Razny", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        assert_equal("Stan", @touch_point_entry.first_name)
        assert_equal("Razny", @touch_point_entry.last_name)
        assert_equal([], @touch_point_entry.touch_points)
        @directory.create_touch_point(@touch_point_entry, Time.now, "Did some real good deals.")
        assert_equal(1, @touch_point_entry.touch_points.size)
        assert_equal("Did some real good deals.", @touch_point_entry.touch_points[0].activity)
    end 

# directory_spec --test_directory_can_delete_touch_point 

    def test_directory_can_delete_touch_point 
        @touch_point_entry =  Entry.new({"first name" => "Jam", "last name" => "Razny", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        assert_equal("Jam", @touch_point_entry.first_name)
        assert_equal("Razny", @touch_point_entry.last_name)
        assert_equal([], @touch_point_entry.touch_points)
        @directory.create_touch_point(@touch_point_entry, Time.now, "Got some real good deals.")
        assert_equal(1, @touch_point_entry.touch_points.size)
        assert_equal("Got some real good deals.", @touch_point_entry.touch_points[0].activity)

        #now use the delete method.

    end 



    def test_class_method_save_update 
        @touch_point_entry =  Entry.new({"first name" => "Stan", "last name" => "Razny", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        @directory.create_touch_point(@touch_point_entry, Time.now, "Did some real good deals.")
        size = @directory.accounts.size 
        @directory.save_update(@touch_point_entry)
         assert_equal(size, @directory.accounts.size)
    end 

  #Directory can add account 
    # # #add_account 

    def test_can_add_account 
        size = @directory.accounts.length
        @directory.add_account(@entry)
        assert_equal(size + 1, @directory.accounts.length)
    end 

    # # #delete_account 

    def test_can_delete_account
        entry = Entry.new({"first name" => "#{rand(1000)}", "last name" => "#{rand(1000)}", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})

        size = @directory.accounts.length
        assert_equal(size, @directory.accounts.length)
        @directory.add_account(entry) #90
        @directory.save_update(entry)
        assert_equal(size + 1, @directory.accounts.length)
        new_size = @directory.accounts.length
        @directory.delete_account(entry) 
        assert_equal(size, @directory.accounts.length)
    end 

    def test_directory_accounts_same_object_id_before_and_after_add_and_delete_account 
        entry = Entry.new({"first name" => "#{rand(1000)}", "last name" => "#{rand(1000)}", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        id = @directory.accounts.object_id
        size = @directory.accounts.size
        @directory.add_account(entry)
        assert_equal(size + 1, @directory.accounts.length)
        selection = @directory.accounts[20]
         @directory.delete_account(selection)
        assert_equal(size, @directory.accounts.length)
        assert_equal(id, @directory.accounts.object_id)
    end 

    def test_save_update_delete 
        initial_size = @directory.accounts.size
        @directory.save_update( @entry, true)
        resulting_size = @directory.accounts.size 
        assert_equal(initial_size - 1, resulting_size)
    end 

    
    def test_save_update_add 
        entry = Entry.new({"first name" => "#{rand(1000)}", "last name" => "#{rand(1000)}", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        initial_size = @directory.accounts.size
        @directory.save_update(entry, false)
        resulting_size = @directory.accounts.size 
        assert_equal(initial_size + 1, resulting_size)
    end 

    def test_marshal_save 
        entry = Entry.new({"first name" => "#{rand(1000)}", "last name" => "#{rand(1000)}", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        directory_before_save = Directory.new(false)
        accounts_before = directory_before_save.accounts.size
        @directory.save_update(entry, false)
        @directory.marshal_save
        assert_equal(accounts_before + 1, @directory.accounts.size)
    end 

    def test_touch_point_index_has_a_hash 
        assert_equal(Hash,@directory.touch_points_index.class)
    end 

    def test_touch_point_index_size_greater_than_1 
        assert_equal(true,@directory.touch_points_index.size > 0)
    end 

    # def test_touch_point_index_size_equals_37 
    #     assert_equal(37,@directory.touch_points_index.size)
    # end 

      def test_touch_point_index_returns_activities 
        assert_equal(6,@directory.touch_points_index['ruby'].length)
    end 

    def test_can_produce_levenshtein_distance 
        assert_equal(0,@directory.distance("Dave", "Dave"))
    end 


    def test_lev_acc_search_returns_a_string
        assert_equal(String, @directory.lev_acc_search('Dave').class)
    end 

   def test_lev_search_returns_a_specific_string
        assert_equal("alex & deanna", @directory.lev_acc_search('Alex Deana'))
    end 

    def test_lev_tp_search_returns_a_string
        assert_equal(String, @directory.lev_tp_search('Rubi').class)
    end 

   def test_lev_tp_returns_a_specific_string
        assert_equal("birthday", @directory.lev_tp_search('birfday'))
    end 




end 