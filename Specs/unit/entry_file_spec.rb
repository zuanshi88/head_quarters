require './Classes/entry_file_class'
require './Classes/entry_class'

require 'test/unit'


class TestEntryFile < Test::Unit::TestCase 

    def setup 
        @entry = Entry.new({"first name" => "Aaron", "last name" => "Whitmer", "email" => "adwhitmer@gmail.com", "phone number" =>"(773) 673-0803"})
    end 


    def test_has_entry 
        assert_equal("Aaron", @entry.first_name)
    end 

    def test_has_variables 
        @entry_id = @entry.object_id
        @variables = [] 
        @variables << "code" << "C:/Coding/Rubywerk/SinatraCRM" << @entry_id
        @file = Entry_File.new(@variables[0], @variables[1], @variables[2])
        system("#{@variables[0]} #{@path}")
        assert_equal("C:/Coding/Rubywerk/SinatraCRM", @file.path)
    end 



    def test_open_file 
        @type = "code"
        @path = "C:/Coding/Rubywerk/SinatraCRM"
        @entry_id= @entry.object_id
        @file = Entry_File.new(@type, @path, @entry_id)
        assert_equal("C:/Coding/Rubywerk/SinatraCRM", @file.path)
    end 



end 