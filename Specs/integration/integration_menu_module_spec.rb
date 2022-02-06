require '../address_book.rb'
require '../Classes/entry_class.rb'
require 'test/unit'


class TestAddressBookIntegration < Test::Unit::TestCase 

    # main_menu, display_account, display_all_accounts, display_contact
    # open contact, entry_menu, edit, touch_points_menu
    
    
    def setup
        @address_book = Address_Book.new()
        @entry = Entry.new({"first name" => "Aaron", "last name" => "Whitmer", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
        @entry_hash = {"first name" => "Zaron", "last name" => "Zitmer", "email" => "zwhitmer@gmail.com", "phone number" =>"(333) 333-3833"}
    end
    
        
    def test_address_book_class 
        assert_equal(Address_Book, @address_book.class)
    end 

        #head_quarters is basically session now.

    def test_address_has_head_quarters 
        assert_equal(Head_Quarters, @address_book.session.class)
    end 

    def test_address_has_main_menu
        assert_equal(true, @address_book.respond_to?(:main_menu))
    end 

    def test_address_can_add_and_save_update 
        size = @address_book.session.database.accounts.size
        @address_book.session.save_update(Entry.new(@entry_hash))
        assert_equal(size + 1, @address_book.session.database.accounts.size)
    end 

    # why isn't this working???? It seems to work in the Directory spec?

     def test_address_can_delete_and_save_update 
        size = @address_book.session.database.accounts.size
        assert_equal(size, @address_book.session.database.accounts.size)
        @address_book.session.save_update(@entry, delete: false)
        assert_equal(size, @address_book.session.database.accounts.size)
        @address_book.session.save_update(@entry, delete: true)
        assert_equal(size, @address_book.session.database.accounts.size)

    end 

    # def test_display_method 
    #     assert_equal(Array, @address_book.display([1,2,3]).class)
    # end 

    def test_display_touch_points_menu

    end 

    #not finding the name searched for...

    def test_display_account 
        assert_equal(Entry, @address_book.display_account("latham").class)
    end 

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