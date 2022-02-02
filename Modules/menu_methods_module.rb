 

module Menu_Methods
    

        def from_today 
            @touch_points.filter{ |tp| tp.date_obj <= Time.now}
        end 

        def the_future
            @touch_points.select{|tp| tp.date_obj > Time.now}
        end 

        def last_n_descending(n, entry = nil)
            if entry == nil 
                @touch_points.select{|tp| tp.date_obj < Time.now}.sort_by{|tp| tp.date_obj}.last(n).reverse
            else  
                entry.touch_points.last(n)
            end 
        end 

        def all_descending(tps = @touch_points)
            tps.sort_by{|tp| tp.date_obj }.reverse
        end 

        def entry_last_n_descending(n, entry)
            entry.touch_points.last(n)
        end 
            

end 