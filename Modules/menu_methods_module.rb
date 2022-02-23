 

module Menu_Methods
    

        def from_today 
            current = @database.touch_points.filter{ |tp| tp.date_obj <= Time.now}
            all_ascending(current)
        end 

        def the_future
            @database.touch_points.select{|tp| tp.date_obj > Time.now}
        end 

        def last_n_descending(n, entry = nil)
            if entry == nil 
                @database.touch_points.select{|tp| tp.date_obj < Time.now}.sort_by{|tp| tp.date_obj}.last(n).reverse
            else  
                entry.touch_points.last(n)
            end 
        end 
        
        def all_ascending(tps = @database.touch_points)
            tps.sort_by{|tp| tp.date_obj }
        end 

        def all_descending(tps = @database.touch_points)
            tps.sort_by{|tp| tp.date_obj }.reverse
        end 

            
end 