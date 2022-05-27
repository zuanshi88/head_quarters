require 'time'
require_relative 'tc_session.rb'


  class Time_Clock 

      attr_reader :database_file, :database, :session_info, :clock_in
      attr_accessor :message

    def initialize
      #this call will create .txt file if it does not alread exist 
      #allowing me to push code to github without my current txt file
      system("touch ./Database/tc_session_database.txt")
      @database_file = './Database/tc_session_database.txt'
      @message = "Welcome to your time clock"
      begin
        @database = marshal_open
      rescue => exception 
        #this code is to keep app from blowing up on first use
        @database = []
        self.marshal_save 
        @database = marshal_open
      end 
    end

    def set_message(mess) 
      @message = mess
    end 

    def marshal_save
        File.open(@database_file, "wb"){|f| f.write(Marshal.dump(@database))}
    end

    def marshal_open 
        File.open(@database_file, "rb"){|from_file| Marshal.load(from_file)}
    end 
   

  

      def change_status 
        @status = !@status
      end 



      def clock_in
            if @database.empty? || @database[-1].status == false
              @database << TC_Session.new
              self.set_message("Session Initiated")
              self.marshal_save
              @database = marshal_open
            else 
              self.set_message("Session in Progress")
              self.marshal_save
              @database = marshal_open
            end 
        end

        def clock_out 
            if @database.empty? 
              return  self.set_message("Sorry, no session in progress")
            end 
            if @database[-1].status == true 
              curr_session = @database.pop
               curr_session.end_session
               refresh_database(curr_session)
              self.set_message("( #{curr_session.start.strftime("%H:%M")} to #{curr_session.end.strftime("%H:%M")} ) time: #{curr_session.total_time}/ new_total: #{totalize_time}")
          
            else 
                self.set_message("Sorry, no session in progress")
            end 
        end 

        def totalize_time 
          @database.map{|session| session.total_time}.reduce(:+).round(2) + 2500 #this number brings over an approx. from original timeclock
        end


        def clock_in_out_display(terminate = false)
            system('clear')
            drop_center
            self.main_menu.each{|line| center_text(line)}
            if terminate
              exit
            end 
            self.options
        end 

        def refresh_database(curr_session) 
          @database << curr_session
          self.marshal_save
          @database = marshal_open
        end 
      end