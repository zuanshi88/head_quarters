 

module Menu_Methods
    

        def from_today 
            @touch_points.filter{ |tp| tp.date_obj <= Time.now}
        end 

        def the_future
            @touch_points.select{|tp| tp.date_obj > Time.now}
        end 

        def last_n_descending(n)
            @touch_points.select{|tp| tp.date_obj < Time.now}.sort_by{|tp| tp.date_obj}.last(n).reverse
        end 

        def all_descending(tps = @touch_points)
            tps.sort_by{|tp| tp.date_obj }.reverse
        end 

        def entry_display_all(entry)
            entry.touch_points.sort_by{|tp| tp.date }.each { |tp| puts "          #{tp.date}: #{tp.activity}"}
            entry_menu(entry, full = false)
        end 

end 