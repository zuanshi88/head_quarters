require 'test/unit'

class TestTest < Test::Unit::TestCase 

    def setup 
        @example = true
    end 

    def test_assert 
        assert(@example, 'Passes if NOT false')
    end 

    def test_block 
        assert_block { 2 + 2 == 4}
    end 



end 