require '../address_book.rb'

require 'test/unit'


class TestAddressBook < Test::Unit::TestCase 

    
    def setup 
        @address_book = Address_Book.new(false)
    end 

    def test_address_book_class 
        assert_equal(Address_Book, @address_book.class)
    end 

    def test_address_has_head_quarters 
        assert_equal(Session, @address_book.session.class)
    end 

    def test_address_book_has_status 
        assert_equal(false, @address_book.status)
    end 
    


end 