require '../Classes/entry_test_class'
require '../Classes/test_class'
require 'test/unit'


# tester = Tester.new("Ruby")
# puts tester.name 
# puts tester.intro
# puts "My first test was testing a #{tester.name} program!"

# entry = EntryTest.new({"first_name" => "Aaron", "last_name" => "Whitmer"})
# puts entry.name 
# puts "#{entry.first_name} is a fine chap."
class TestEntry < Test::Unit::TestCase 
    def test_entry_name 
        entry = EntryTest.new({"first_name" => "Aaron", "last_name" => "Whitmer"})
        assert_equal("Karen Whitmer", entry.name)
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