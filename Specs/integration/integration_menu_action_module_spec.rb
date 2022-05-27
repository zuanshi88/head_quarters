require 'test/unit'
require './Classes/session_class.rb'
require './Classes/entry_class.rb'
require './Classes/directory_class.rb'
require './Modules/menu_module.rb'


class MenuActionModuleIntegration < Test::Unit::TestCase 
    
    include Menu

    def setup 
        @database = Directory.new(false)
        @acc_selection = @database.accounts_index["whitmer"]
        @tp_selection = @database.touch_points_index["writing"]
    end 

    def test_database_has_accounts 
        assert_operator(200, :<, @database.accounts.size)
    end 

    def test_acc_selections_have_content 
           assert_operator(8, :<=, @acc_selection.size)
        # assert_equal(10, @tp_selection.size)

    end 

     def test_tp_selections_have_content 
        assert_operator(8, :<=, @tp_selection.size)
    end 


    def test_create_selection_hash_action 
       assert_equal(Hash, create_selection_hash_action(@acc_selection).class)
    end 

    def test_selection_hash_has_values 
        selection_hash = create_selection_hash_action(@acc_selection)
        assert_operator(6, :<=, selection_hash.values.size)
    end 


end 