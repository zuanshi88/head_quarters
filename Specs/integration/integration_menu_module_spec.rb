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


end 