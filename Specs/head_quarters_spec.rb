require '../Classes/head_quarters.rb'
require '../Classes/directory_class'
require '../Classes/word_index_class'
require '../Classes/entry_class'
require '../Classes/touch_point_class'

require './Modules/menu_module'
require './Modules/formatting_module'
require 'minitest'

class Test_Head_Quarters < Test::Unit::TestCase

    def setup 
        @head_quarters = Head_Quarters.new()
    end 

    def test_head_quarters_has_class 

    end 

end 