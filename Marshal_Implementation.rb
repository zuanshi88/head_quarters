require_relative 'address_book_module.rb'
require_relative 'Entry_Class.rb'
require_relative 'Touch_Point_Class.rb'
include Address_book_module

FILE = "backup_entries_3.txt"
FILE_2 ="backup_entries_4.txt"


neo_directory = marshal_directory(FILE_2)

selection = neo_directory.select{|obj| obj.name = "Dave Clauson"}

test_array = []

test_array << selection[0].name << selection[0].first_name << selection[0].last_name

p test_array

def create_index(directory)
  index = {}
  directory.each do |entry|
    to_index = []
    to_index << entry.name << entry.first_name << entry.last_name
    to_index.each do |word|
      index[word.downcase] = [] if index[word].nil?
      index[word.downcase].push(entry)
    end
  end
  index
end

my_index = create_index(neo_directory)

p my_index.class

p my_index["marcus"]

a, b = 5, 8
example_array = []
example_array << a << b
p example_array

hash_hash = {}
hash_hash["a"] = []

test_array.each{|word| hash_hash[word] = selection[0]}

hash_hash["a"] << a << b

p hash_hash["a"]
puts hash_hash


class WordIndex
  def initialize
    @index = Hash.new(nil)
  end

  def index(anObject, *phrases)
    phrases.each do |aPhrase|
      aPhrase.scan /\w+/ do |aWord|
        aWord.downcase!
        @index[aWord] = [] if @index[aWord].nil?
        @index[aWord].push(anObject)
      end
    end

    def lookup(aWord)
      @index[aWord.downcase]
    end 

  end


# hard_save_directory(directory, FILE)
