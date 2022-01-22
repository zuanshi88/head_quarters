

module Menu_Methods_Module

        def display_points
            @touch_points.sort_by{|tp| tp.date_obj}.reverse.each do |tp|
                puts "#{tp.date}:  #{tp.account_name} (#{tp.activity})" 
            end 
        end

        def display_all_descending
            @touch_points.sort_by{|tp| tp.date_obj}.reverse.each do |tp|
                puts "#{tp.date}: PENIS #{tp.account_name} (#{tp.activity})"
            end 
        end

        def from_today_descending
            from_today = @touch_points.select{|tp| tp.date_obj < Time.now}
            descending = from_today.sort_by{|tp| tp.date_obj}
            descending.each{|tp| puts "#{tp.date}:  #{tp.account_name} (#{tp.activity})"}
        end

        def last_ten_descending
            system("clear")
            from_today = @touch_points.select{|tp| tp.date_obj < Time.now}
            descending = from_today.sort_by{|tp| tp.date_obj}.reverse.first(10)
            descending.each{|tp| puts "#{tp.date}:  #{tp.account_name} (#{tp.activity})"}
        end 

        def entry_last_ten_descending(entry)
            entry.touch_points.last(10).each { |tp| puts "#{tp.date}:  #{tp.account_name} (#{tp.activity})" }
        end 

        def entry_display_all(entry)
            entry.touch_points.sort_by{|tp| tp.date }.each { |tp| puts "          #{tp.date}: #{tp.activity}"}
            entry_menu(entry, full = false)
        end 

        def from_start_ascending
            ascending = @touch_points.sort_by{|tp| tp.date_obj}
            ascending.reverse.each{|tp| puts "#{tp.date}:  #{tp.account_name} (#{tp.activity})"}
        end

    # def sort_and_print
    #   tps = @touch_points
    #     tps.sort_by{|tp| tp.date_obj}
    #     tps.each { |tp| puts "          #{tp.date}: #{tp.activity}"}
    #   end


end 