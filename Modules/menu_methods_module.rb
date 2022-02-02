 

module Menu_Methods
    
        def display_all_descending
            @touch_points.sort_by{|tp| tp.date_obj}.reverse.each do |tp|
                puts "#{tp.date}: #{tp.account_name} (#{tp.activity})"
            end 
        end

        def show_the_future
            the_future = @touch_points.select{|tp| tp.date_obj > Time.now}
            the_future.each{|tp| puts "#{tp.date}:  #{tp.account_name} (#{tp.activity})"}
        end 

        
            #specific entry's LAST TEN
            #place holder for code moving to menu_module
            #display entry last ten tp
     

        def entry_display_all(entry)
            entry.touch_points.sort_by{|tp| tp.date }.each { |tp| puts "          #{tp.date}: #{tp.activity}"}
            entry_menu(entry, full = false)
        end 

end 