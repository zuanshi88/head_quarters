 

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

        def from_today 
            @touch_points.select{|tp| tp.date_obj < Time.now}
        end 

        def from_today_descending
            from_today.sort_by{|tp| tp.date_obj}.each{|tp| puts "#{tp.date}:  #{tp.account_name} (#{tp.activity})"}
        end
            #all touch points LAST TEN
        def last_ten_descending
            last_ten = from_today.sort_by{|tp| tp.date_obj}.reverse.first(10)
            last_ten.each{|tp| puts "#{tp.date}:  #{tp.account_name} (#{tp.activity})"}
        end 
            #specific entry's LAST TEN
        def entry_last_ten_descending(entry)
            entry.touch_points.last(10).each { |tp| center_"#{tp.date}:  #{tp.activity}" }
        end 

        def last_ten_touch_points(entry)
            puts "Last Ten Touch Points:"
            puts "______________________"
            puts ""
            entry_last_ten_descending(entry)
            entry_menu(entry, full = false)
        end 

        def entry_display_all(entry)
            entry.touch_points.sort_by{|tp| tp.date }.each { |tp| puts "          #{tp.date}: #{tp.activity}"}
            entry_menu(entry, full = false)
        end 

end 