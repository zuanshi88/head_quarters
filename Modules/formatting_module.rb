require 'time'
module Formatting

      def drop_center 
        20.times{ puts ""}
      end 

      def drop_n_lines(n)
        n.times {puts " "}
      end 

      def clear_drop_center
          system("cls")
          drop_center
      end 

      def center_text(text, new_line = true)
            50.times{ print " "}
          if new_line 
            puts text 
          else 
            print text
          end 
      end 

      def off_center_text
          38.times{ print " "}
          if new_line 
            puts text 
          else 
            print text
          end 
        end 
  end
