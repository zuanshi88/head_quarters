require_relative 'address_book_module'

class Directory

  include Address_book_module

  attr_reader :accounts, :accounts_index

  def initialize(file)
    @accounts = File.open(file, "rb"){|from_file| Marshal.load(from_file)}
    @accounts_index = WordIndex.new(@accounts).index
  end

  def create_tps
    tps = []
      @accounts.each do |entry|
      unless entry.touch_points.empty?
        entry.touch_points.each do |tp|
          tps << tp
        end
      end
      end
      return tps
    end

  def search(target)
        begin
        result =  @accounts_index[target]
        if result.nil?
            puts "#{result} didn't return a match. Try again"
        else
            account_hash = {}
            result.each_with_index{|acc, index| account_hash[index] = acc}
            if account_hash.length == 1
            return account_hash[0]
            else
            account_hash.each_key{|key| center_text("#{key}: #{account_hash[key].name}"); puts ""}
            selection = gets.chomp
            return account_hash[selection.to_i]
        end
    end
        rescue => error  
        puts "You wrote a bad, bad song!"
        puts error.message
        exit
        end
    end 


    def delete_account(entry)
      @accounts.delete(entry)
    end


  end
