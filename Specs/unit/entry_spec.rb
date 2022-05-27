require './Classes/entry_class'
require 'test/unit'


# tester = Tester.new("Ruby")
# puts tester.name 
# puts tester.intro
# puts "My first test was testing a #{tester.name} program!"

# entry = EntryTest.new({"first_name" => "Aaron", "last_name" => "Whitmer"})
# puts entry.name 
# puts "#{entry.first_name} is a fine chap."
class TestEntry < Test::Unit::TestCase 

    def setup 
        @entry = Entry.new({"first name" => "Aaron", "last name" => "Whitmer", "email" => "hitman@gmail.com", "phone number" =>"(888) 888-8888"})
    end 

    def test_entry_name 
        assert_equal("Aaron", @entry.first_name)
        assert_equal("Whitmer", @entry.last_name)
        assert_equal("Aaron Whitmer", @entry.name)
    end 

    def test_entry_address 
        assert_equal("", @entry.address)
        assert_equal("", @entry.street_address)
        assert_equal("", @entry.city)
        assert_equal("", @entry.state)
        assert_equal("", @entry.zipcode)
    end 

    def test_entry_email 
         assert_equal("hitman@gmail.com", @entry.email)
    end 

    def test_entry_phone_number 
        assert_equal("(888) 888-8888", @entry.phone_number)
    end 

    def test_entry_array_empty 
        assert_empty(@entry.touch_points)
    end 

    def test_entry_has_empty_files_array 
            assert_equal([], @entry.files)
    end 


end 
