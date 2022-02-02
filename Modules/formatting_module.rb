require 'time'
module Formatting

      def drop_center 
        20.times{ puts ""}
      end 

      def drop_n_lines(n = 1)
        n.times {puts " "}
      end 

      def clear_drop_center
          system("cls")
          drop_center
      end 

      def center_text(text, n, new_line = true)
            n.times{ print " "}
          if new_line 
            puts text 
          else 
            print text
          end 
      end 
  end
