require '../address_book.rb'
require '../Classes/entry_class.rb'
require 'test/unit'


class TestAddressBook < Test::Unit::TestCase 

    
    def setup 
        @file = 'c_read_test_database.txt'
        @address_book = Address_Book.new()
        @entry = Entry.new({"first name" => "Aaron", "last name" => "Whitmer", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
    end 

    def test_address_book_class 
        assert_equal(Address_Book, @address_book.class)
    end 

        #head_quarters is basically session now.

    def test_address_has_head_quarters 
        assert_equal(Session, @address_book.session.class)
    end 

    def test_address_has_main_menu
        assert_equal(true, @address_book.respond_to?(:main_menu))
    end 

    def test_session_respond_to_save_update 
        assert_equal(true, @address_book.session.respond_to?(:save_update))
    end 

    def test_address_book_has_database 
        assert_equal("../Specs/a_marshaled_database.txt",@address_book.session.database.database_file)
    end 
    
    # def test_session_can_save_update 
    #     asset_equal(false, @address_book.session.save_update(@entry))
    # end 

    


end 