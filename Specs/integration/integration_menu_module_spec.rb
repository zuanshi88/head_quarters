require 'test/unit'
require './Classes/session_class.rb'
require './Classes/entry_class.rb'
require './Classes/entry_file_class'


class TestAddressBookIntegration < Test::Unit::TestCase 



    # main_menu, display_account, display_all_accounts, display_contact
    # open contact, entry_menu, edit, touch_points_menu
    
    
    def setup
          #we are loading our data from the @read_file
        #we are saving the results of our test runs to the @write file
        @session = Session.new(false)
        @entry = Entry.new({"first name" => "Aaron", "last name" => "Whitmer", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        @entry_hash = {"first name" => "Zaron", "last name" => "Zitmer", "email" => "zwhitmer@gmail.com", "phone number" =>"(333) 333-3833"}
    end
    

    def test_address_book_has_database 
        assert_equal("./Database/a_read_test_database.txt", @session.database.database_file)
    end

        #head_quarters is basically session now.

    def test_address_has_head_quarters 
        assert_equal(Session, @session.class)
    end 

    def test_address_has_main_menu
        assert_equal(true, @session.respond_to?(:main_menu))
    end 

    def test_has_database 
        assert_equal(Array,  @session.database.accounts.class)
    end 

    def test_database_has_accounts_index 
        assert_equal(Hash, @session.database.accounts_index.class)
    end 


    def test_database_has_accounts_index_with_argument_returns_array 
         #this creates an array on accounts
        assert_equal(Array, @session.database.accounts_index["latham"].class)
    end 

    def test_create_selection_hash_action
       #this turns array into a Hash
         selection = @session.database.accounts_index["latham"]
        assert_equal(Hash, @session.create_selection_hash_action(selection).class)
    end 

    #next here would be to test display_contact and open_contact ...

    def test_address_can_add_and_save_update 
        size = @session.database.accounts.size
        # @address_book.session.save_update(Entry.new(@entry_hash))
        assert_equal(size, @session.database.accounts.size)
    end 

    # why isn't this working???? It seems to work in the Directory spec?

    def test_database_has_class 
        assert_equal(Directory, @session.database.class)
    end 

    def test_database_can_respond_to_save_update 
        assert_equal(true, @session.database.respond_to?(:save_update))
    end 


     def test_database_has_save_obj_id_before_and_after_save_update 
        id = @session.database.object_id
         @session.database.save_update(@entry, true)
         assert_not_equal(id, @session.object_id)
     end 

     def test_address_can_delete_and_update
        entry = Entry.new({"first name" => "#{rand(1000)}", "last name" => "#{rand(1000)}", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        size = @session.database.accounts.size
        @session.database.save_update(entry)
        @session.refresh_database_instance
        assert_equal(size + 1, @session.database.accounts.size)
     end 

        def test_create_touch_point_call 
            size = @entry.touch_points.size 
            @session.database.create_touch_point(@entry, Time.now, "Playing SUPER FUN games") 
            assert_equal(size + 1, @entry.touch_points.size)
        end 

        def test_session_can_add_touch_point_at_both_entry_and_database_levels
            size = @entry.touch_points.size 
            total_size = @session.database.touch_points.size
            @session.database.create_touch_point(@entry, Time.now, "Playing SUPER FUN games") 
            assert_equal(size + 1, @entry.touch_points.size)
            @session.refresh_database_instance
            assert_equal(total_size + 1, @session.database.touch_points.size)
        end 


        def test_refresh_database_instance_call 
            old_id = @session.database.object_id
            @session.refresh_database_instance
            assert_not_equal(old_id, @session.database.object_id)
        end 
        

end 