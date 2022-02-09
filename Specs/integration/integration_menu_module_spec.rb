require '../Classes/session.rb'
require '../Classes/entry_class.rb'
require 'test/unit'


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
        assert_equal("../Database/a_read_test_database.txt", @session.database.database_file)
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
         selection = @address_book.session.database.accounts_index["latham"]
        assert_equal(Hash, @session.create_selection_hash_action(selection).class)
    end 

    #next here would be to test display_contact and open_contact ...

    def test_address_can_add_and_save_update 
        size = @address_book.session.database.accounts.size
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

     def test_address_can_delete_and_save_update 
        size = @address_book.session.database.accounts.size
        assert_equal(size, @session.database.accounts.size)
        @session.database.save_update(@entry)
        assert_equal(size + 1, @session.database.accounts.size)
     end 


     def test_database_has_save_obj_id_before_and_after_save_update 
        id = @session.database.object_id
         @session.database.save_update(@entry, delete: true)
         assert_not_equal(id, @session.object_id)
     end 

     def test_address_can_delete_and_update 
        size = @session.database.accounts.size
        @session.database.save_update(@entry)
        assert_equal(size + 1, @session.database.accounts.size)
     end 

        def test_create_touch_point_call 
            size = @entry.touch_points.size 
            @session.database.create_touch_point(@entry, Time.now, "Playing SUPER FUN games") 
            assert_equal(size + 1, @entry.touch_points.size)
        end 


        



    # def test_display_method 
    #     assert_equal(Array, @address_book.display([1,2,3]).class)
    # end 

    # def test_display_touch_points_menu

    # end 

    #not finding the name searched for...

    # # def test_display_account 
    #     assert_equal(Entry, @address_book.display_account(["latham"]).class)
    # # end 

    # case action
    #             when 3
    #               save_update(entry: Entry.new(add_entry_action))
    #               refresh_database
    #             when 4
    #                 clear_drop_center
    #                 # display_last_ten_entry_touch_points_title
    #                 drop_n_lines
    #               display(last_n_descending(10))
    #                 drop_n_lines
    #               touch_points_menu(false)
    #             when 8
    #               display_all_accounts(@database.accounts)
    #               main_menu(false)
    #             when 9
    #               display_account(@database.accounts_index[select_account_action])
    #             else 
    #               exit
    #             end


end 