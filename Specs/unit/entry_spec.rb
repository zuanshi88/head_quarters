require '../Classes/entry_class'
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
        @entry = Entry.new({"first name" => "Aaron", "last name" => "Whitmer", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
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
         assert_equal("adwhitmer@gmail.com", @entry.email)
    end 

    def test_entry_phone_number 
        assert_equal("(773) 673-0803", @entry.phone_number)
    end 

    def test_entry_array_empty 
        assert_empty(@entry.touch_points)
    end 


end 



# class TesterTest < Test::Unit::TestCase 

#     def new_entry_has_attributes
#         assert_equal("Ruby", Tester.new("Ruby").name)
#     end 
    
    
# end 


# puts entry.class
# puts entry.first_name
# puts entry.last_name 
# puts entry.address

#     begin
#         puts entry.first_name
#     rescue => e 
#         puts e.message
#     end

    # puts "We are finally programming... for real."