=begin

* Marshal Module is having issues...
* Also... did not do a good job keeping up with commits


=end




require 'json'
require_relative 'address_book_module.rb'
require_relative 'Entry_Class.rb'
require_relative 'Touch_Point_Class.rb'
include Address_book_module

ENTRIES = "backup_entries_5.txt"

class Session

  attr_reader :database, :touch_points

  def initialize
    @database = Directory.new(ENTRIES)
    @touch_points = create_tps
    main_menu
  end

  def create_tps
    tps = []
      database.accounts.each do |entry|
      unless entry.touch_points.empty?
        entry.touch_points.each do |tp|
          tps << tp
        end
      end
      end
      return tps
    end


  def main_menu

    puts "                                                                 ==== === =   === === ===== = ======= ==== === ===== === == ==== = == =="
    puts "                                                                  ===  ==== ==== ===== === ==== ADDRESS BOOK 7 == = == == === =========== ====="
    puts "                                                                  =  ==  ===== == ======= === ==== == ===== ========= ===== ===== ======= ="
    puts "                                                                     add (1) |  touch points (3) | contacts (6) | open (7) | exit (*)"
    puts "                                                                   = == ========= =========== == == ==== ============= ===== === = ===="
    puts "                                                                   ======== =============== ======== = = ====== ===== == ======== ========== =="
    puts "                                                                 === ===== == = = = ===== === ===== === == == = == ===== == === === === =="

        action = gets.to_i

        case action
        when 1
          marshal_save(save_entry(add_entry, database.accounts), ENTRIES)
        when 3
          touch_points_menu
        when 6
          directory(database.accounts)
          main_menu
        when 7
          open_contact
          main_menu
        else
          exit
        end
      end

      def add_entry
        puts "first name:"
        first_name = gets.chomp
        puts "last name:"
        last_name = gets.chomp
        puts "street address:"
        street_address = gets.chomp
        puts "city:"
        city = gets.chomp
        puts "state:"
        state = gets.chomp
        puts "zipcode"
        zipcode = gets.chomp
        address = {"street_address" => street_address,
                        "city" => city,
                        "state" => state,
                        "zipcode" => zipcode
                      }
        name = "#{first_name} #{last_name}"

        puts "phone:"

        phone_number = gets.chomp.to_s

        puts "email:"
        email = gets.chomp.to_s

        touch_points = []

        entry_info = {"first name" => first_name, "last name" => last_name, "address" => address, "phone number" => phone_number, "email" => email, "name" => name, "touch_points" => touch_points}
        entry_info
      end


      def directory(database)
        #this is all pushed way over for easier reading upon display
        alphbetic_directory = database.sort_by{|obj| obj.last_name.downcase}
          puts ""
          puts ""
          puts "                                                                _________________________________________________________________________"
          puts ""
        alphbetic_directory.each do |entry|
          puts "                                                                  - #{entry.last_name}, #{entry.first_name} |  #{entry.street_address} | #{entry.city}, #{entry.state} #{entry.zipcode} - "
          puts "                                                                _________________________________________________________________________"
          puts ""
        end
      end

      def display_contact(obj)
        # 1st  used address_hash = JSON.parse(obj["address"])
        # 2nd did the JSON conversion earlier and then used HASH KEYS to access info_hash
        # 3rd decided to initiate defined ENTRY obj before displaying or editing.

        %x(echo clr)
        puts " "
        puts " "
        puts " "
        print "          ", obj.name
        puts ""
        print "          "
        puts obj.street_address
        print "          ", obj.city, ", "
        print obj.state
        print " "
        puts obj.zipcode
        print "          "
        puts obj.phone_number
        print "          "
        puts obj.email
        if obj.touch_points.empty?
          puts ""
        else
          tp_obj_array = obj.touch_points
          sorted_tp_obj_array = tp_obj_array.sort_by{|tp| tp.date_obj }.reverse
          sorted_tp_obj_array.each { |tp| puts "          #{tp.date}: #{tp.activity}"}
        end
          2.times{puts""}
        end
      end

#12/15/2020: how to delete a hash in an array of hashes?


    def open_contact
        target = gets.chomp
      begin
        result = @database.search(target.downcase)
        display_contact(result)
      rescue
        p "#{target} not found. Try again."
        open_contact
      end
        entry_menu(result)
    end

      def entry_menu(entry)

        puts "      = = = == === = = = == = == =  === = === === ===== =="
        puts "          edit (1) | all (5) | add (9) | main menu (0) | exit (*)"
        puts "       === == ==  = = =  = = = ==== === = = = = = = = = = == "

        selection = gets.to_i

        case selection

        when 1
          edit(entry)
        when 5
         entry.touch_points.each { |tp| puts "          #{tp.date}: #{tp.activity}"}
        when 9
          add_touch_point(entry)
        when 0
          main_menu
        else
          exit
       end
      end

      def edit(entry)
        puts "    == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = ==   = = ="
        puts "  === == = == =  == =  === = = = = === = = =  ===  === =  == = =  === = = === = = "
        puts "    name (1) | address (2) | phone (3) | email (4) | touch points (6) | delete (7) | entry menu (9) | main menu (*) "
        puts " == = = = =  == = = == = = = = ==  === = = = = = = = = = == = = = = = =  = = = == == = ="
        puts "  = = == = ==  = = = == =  == =  === = = = = === = = =  ===  === =  == = =  === = =  = = "

        selection = gets.chomp

        #dup the entry to remove to preserve original copy in order to delete original
        #from database array after editing and before re-adding edited area to avoid
        #entry duplication.



        case selection.to_i
        when 1
          puts "NEW first name:"
          first_name = gets.chomp
          entry.first_name =  first_name
          puts "NEW last name"
          last_name = gets.chomp
          entry.last_name = last_name
        when 2
          puts "NEW street address"
          street_address = gets.chomp
          entry.street_address = street_address
          puts "City, State Zip"
          city_state_zip = gets.chomp
          search_form = /(\w+),?\s+(\w+)\s+(\d+)/
          results = search_form.match(city_state_zip)
          entry.city = results[1]
          entry.state = results[2]
          entry.zipcode = results[3]
        when 3
          puts "NEW phone number"
          phone_number = gets.chomp
          entry.phone_number = phone_number
        when 4
          puts "NEW email"
          email = gets.chomp
          entry.email = email
        when 6
          tp_hash = {}
          unless entry.touch_points.empty?
          entry.touch_points.each_with_index do |tp, i|
            tp_hash[i] = tp
          end
        end
        puts "this hash has #{tp_hash.size} elements"
          tp_hash.each{|k,v| puts "#{k}: #{v.date}, #{v.activity}"}
          puts "Delete \# ?"
          delete_tp = gets.to_i
          tp_hash.delete(delete_tp)
          entry.touch_points.delete_at(delete_tp)
        when 7
          puts "Are you sure?"
          response = gets.chomp
          index = @database.accounts.index(entry)

          response.downcase.include?("y") ? @database.accounts.delete_at(index) : entry_menu(entry)
          marshal_save(@database.accounts, ENTRIES)
          main_menu
        when 9
          entry_menu(entry)
        else
          main_menu
      end
      #have I moved away from the dup design?
        save_update(entry)
        display_contact(entry)
        edit(entry)
       end




  def touch_points_menu
    puts "   ===  ==== ==== ===== === ==== = = == = == == = == == === =========== ====="
    puts "  =  ==  ===== == ======= === ==== == ===== ========= ===== ===== ======= ="
    puts "       display (1) | all (3) | current (5) | historical (6) | main_menu (*)"
    puts "  = == ========= =========== == == ==== ============= ===== === = ===="
    puts "  ======== =============== ======== = = ====== ===== == ======== ========== =="


    selection = gets.chomp

    case selection.to_i

    when 1
      display_points
      touch_points_menu
    when 3
      display_all_descending
      touch_points_menu
    when 5
      from_today_descending
      touch_points_menu
    when 6
      from_start_ascending
      touch_points_menu
    else
      main_menu
    end
  end

    def display_points
      puts "are we in???"
        all_points = @touch_points.sort_by{|tp| tp.date_obj}.reverse
        all_points.each{|tp| puts "#{tp.date}:  #{tp.account_name} (#{tp.activity})"}
    end

    def display_all_descending
      tps = @touch_points
        descending = tps.sort_by{|tp| tp.date_obj}.reverse
        descending.each { |tp| puts "          #{tp.date}: #{tp.activity}"}
      end

    # def sort_and_print
    #   tps = @touch_points
    #     tps.sort_by{|tp| tp.date_obj}
    #     tps.each { |tp| puts "          #{tp.date}: #{tp.activity}"}
    #   end

    def from_today_descending
      from_today = @touch_points.select{|tp| tp.date_obj < Time.now}
      descending = from_today.sort_by{|tp| tp.date_obj}.reverse
      descending.each { |tp| puts "          #{tp.date}: #{tp.activity}"}
    end

    def from_start_ascending
      tps = @touch_points
        ascending = tps.sort_by{|tp| tp.date_obj}
        ascending.each { |tp| puts "          #{tp.date}: #{tp.activity}"}
    end




Session.new

#TO DO list
# clean up code, get better with comments.
#prompt for missing info
#using ^for searching/open
#search, add, remove (check for duplicates)
#foreign address handler?
#code to stop repeats
#add time stamp and a sort by date function
#list all enties alphabetically...
#add touch_points

#12/16/2020: Make a new menu to display different views of directory_hash
#alphbetic, last contact, etc,

#12/19/2020:  Working on full integrating the ENTRY OBJECT into the design.
#             Should have started with this approach from the beginning,
# =>          But did not know this apprach-- it has been a learning process!
# =>          But very good I think!!

#12/19/2020: Stuck trying to clean up the touch_point mess
# =>        learning why design saves time.
# =>        stuck in ab_sketchbook_5 on creating an array of symbols...


#12/24/2020:
# => touch point object2
# => display object

#04/17/2021
# => have added Marshalling and index
