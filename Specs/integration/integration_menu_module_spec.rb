require '../address_book.rb'
require 'test/unit'


class TestAddressBookIntegration < Test::Unit::TestCase 

    # main_menu, display_account, display_all_accounts, display_contact
    # open contact, entry_menu, edit, touch_points_menu
    
    
    def setup
        @address_book = Address_Book.new()
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

    def test_address_can_save_update 
        size = @address_book.database.accounts.size
        @address_book.add_entry_action
        assert_equal(size + 1, @address_book.database.accounts.size)
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