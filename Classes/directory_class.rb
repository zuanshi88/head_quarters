require './Modules/formatting_module'
require './Modules/utility_module'
require_relative 'word_index_class'

class Directory

  include Utility

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
            nil 
        else
            account_hash = {}
            result.each_with_index{|acc, index| account_hash[index] = acc}
            return account_hash
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

    def self.save_entry(new_entry, database)
        updated_database = database.push(new_entry)
        updated_database
    end 


  end
