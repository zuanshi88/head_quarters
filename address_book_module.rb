module Address_book_module
#should this methods be stored here? or inside SESSION?

# can I access the ENTRIES and convert them to HASHes and put them back?

# takes a file, returns an array of objects

def marshal_directory(file)
  accounts = File.open(file, "rb"){|from_file| Marshal.load(from_file)}
end

def marshal_save(file,obj_array)
  File.open(file, "wb"){|f| f.write(Marshal.dump(obj_array))}
end

      # def open_directory(file)
      #   new_open_directory = []
      #   directory = File.open(file, "r")
      #   directory.each_line do |entry|
      #   new_open_directory << eval(entry)
      #   end
      #     directory.close
      #     obj_array(new_open_directory, Entry)
      # end

      # def obj_array(database, type)
      #     obj_array = []
      #     database.each do |entry|
      #     obj_array << type.new(entry)
      #   end
      #   obj_array
      # end

  def open_touch_points(obj)
        obj_array = []
        obj.touch_points.each do |tps|
          tps.each do |tp|
          obj_array << Touch_Point.new(eval(tp))
        end
      end
        obj_array
      end


      def save_entry(entry, database)
        new_entry = Entry.new(entry)
        database = database << new_entry
        puts "#{new_entry.name} has been added."
      end

      def prepare_argument_hashes(objs)
        save_array = []
        objs.each{|obj| save_array << Marshal.dump(obj)}
        save_array
      end

      # def hard_save_directory(database, file)
      #   hash_array = prepare_argument_hashes(database)
      #   write_file = File.open(file, "w")
      #   write_file.puts hash_array
      #   write_file.close
      # end

      def simplify(database)
        database.map { |obj| obj.name.downcase.scan(/[\w]/).uniq}
      end

      def name_hasher(name)
          name_hash = {}
          name.map{|char| name_hash[char] = char}
          name_hash
      end

      def obj_to_fullname_hash(database)
        simple_name_database = simplify(database)
        name_hash_array = []
        simple_name_database.each do |obj|
          new_hash = {}
          obj.map do |letter|
          new_hash[letter] = letter
          end
          name_hash_array << name_hasher(obj)
        end
          name_hash_array
      end


      def capture_hash_and_index(hash, index, matches, fudge_width)
            match = hash.values.join("")
            matches << [index, hash, fudge_width]
      end

      def calculate_fudge(search_hash, hash_name_array, matches, search)
        hash_name_array.each_with_index do |hash, index|
        fudge_width = search_hash.merge(hash).length - search.length
        fudge_width <= 0 ? capture_hash_and_index(hash, index, matches, fudge_width) : next
         end
      end

      def best_match(matches, search_hash, database)
        puts " This is the result!!"
        puts "++++++++++"
        puts search_hash
        puts "++++++++++"
        final_match = matches.select{ |match| match[1].first == search_hash.first}.pop
        puts matches
        database[final_match[0]]
        # best_match = database[best_array_index]
        # best_match
      end


      def hash_name_compare(search, database, matches)
        hash_name_array = obj_to_fullname_hash(database)
        search_hash = name_hasher(search.downcase.split(""))
        calculate_fudge(search_hash, hash_name_array, matches, search)
        final_match = best_match(matches, search_hash, database)
        final_match
      end

      def value_checker(value, file)
        value_array = []
        value_file = File.open(file, "r")
        value_array.each{|entry| value_array << entry}
        time_now = Time.new
        value_array << "time: #{time_now.month}/#{time_now.day}/#{time_now.year}class:#{value.class}; #{value}"
        write_to_file = File.open(file, "w")
        write_to_file.puts value_array
      end

      def select_entry(search, database)
        selection = database.select{|obj| obj.name == search}
      end


      def reset_touch_points(obj_array)
        obj_array.each{|obj| obj.touch_points = []}
        obj_array
      end

      def search_exist?(search, database)
        exist = false
        directory.each do |entry|
          if entry.name == search
            exist = true
          else
            next
          end
        end
        exist
      end


  end
