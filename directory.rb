require_relative 'utility_module'
require_relative 'word_index.rb'

class Directory

  include Utility_Module

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

    def delete_account(entry)
      @accounts.delete(entry)
    end


  end
