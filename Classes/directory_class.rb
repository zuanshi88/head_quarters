require_relative 'entry_class.rb'
require_relative 'entry_file_class.rb'
require_relative 'touch_point_class.rb'
require 'did_you_mean'



class Directory

  attr_reader :status, :database_file, :accounts_index, :touch_points, :touch_points_index
  attr_accessor :accounts

  def initialize(status)
    @status = status
    @database_file = status ? './Database/a_read_test_database.txt' : './Database/a_read_test_database.txt'
    @accounts = File.open(@database_file, "rb"){|from_file| Marshal.load(from_file)}
    @accounts_index = self.index_accounts 
    @touch_points = create_tps  
    @touch_points_index = self.index_touch_points
  end

  #instance variable called by all instances of directories to provide
  #up-to-date touch points 

  #pull instance variable out and pass it to Touchpoints to produce all
  # of its data. Directory can ask for the touch points from touch_points. 
  
   def index_accounts
            # information = ["name", "last_name", "first_name"]
            index_hash = {}
            @accounts.cycle(1) do |obj|
            index_hash[obj.name.downcase] = [] if index_hash[obj.name.downcase].nil?
            index_hash[obj.name.downcase].push(obj)
            index_hash[obj.last_name.downcase] = [] if index_hash[obj.last_name.downcase].nil?
            index_hash[obj.last_name.downcase].push(obj)
            index_hash[obj.first_name.downcase] = [] if index_hash[obj.first_name.downcase].nil?
            index_hash[obj.first_name.downcase].push(obj)
            index_hash[obj.city.downcase] = [] if index_hash[obj.city.downcase].nil?
            index_hash[obj.city.downcase].push(obj)
            index_hash[obj.state.downcase] = [] if index_hash[obj.state.downcase].nil?
            index_hash[obj.state.downcase].push(obj)
            end
            index_hash
    end

    def index_touch_points(touch_points = @touch_points)
          
            touch_point_hash = {}
            touch_points.each_with_index do |tp, index|
              unless tp.activity.empty?
                tp.activity.split(/[ \W]/).each do |word|
                  unless word == nil 
                    word.gsub!(/\W/, '')
                    touch_point_hash[word.downcase] = [] if touch_point_hash[word.downcase].nil? 
                    touch_point_hash[word.downcase].push(tp)
                  end 
                end 
              end 
          end 
            touch_point_hash
    end

  
  
  def create_tps
    tps = []
      self.accounts.each do |entry|
        unless entry.touch_points.empty?
          entry.touch_points.each do |tp|
            tps << tp
          end
        end
      end
      return tps
    end

    def create_touch_point(entry, create_date, activity)
      entry.touch_points << Touch_Point.new(entry.object_id, entry.name, create_date, activity)
      save_update(entry)
    end 
 
    def delete_touch_point(entry, tp)
      entry.touch_points.delete(tp)
      self.touch_points.delete(tp)
      save_update(entry)
    end 


    def create_entry_file(entry, attributes)
      if entry.files.nil? 
        entry.files = []
      end 
      entry.files << Entry_File.new(*attributes, entry.object_id)
      save_update(entry)
    end 

    def delete_entry_file(entry, file)
      entry.files.delete(file)
      save_update(entry)
    end 


    def save_update(entry, delete = false)
           delete_account(entry)
            if delete == false 
               self.add_account(entry)
            end 
            marshal_save  
    end 

    def marshal_save
        File.open(@database_file, "wb"){|f| f.write(Marshal.dump(@accounts))}
    end

    def add_account(entry)
      @accounts.push(entry)
    end 

    def delete_account(entry)
      @accounts.filter!{|acc| acc.name != entry.name}
    end

    def distance(word1, word2)
      DidYouMean::Levenshtein.distance(word1, word2)
    end 

    def lev_acc_search(word)
      @accounts_index.keys.sort_by{ |key| self.distance(word, key) }.first
    end 

    def lev_tp_search(word, word_index = @touch_points_index)
      word_index.keys.sort_by{ |key| self.distance(word, key) }.first
    end 

  end
