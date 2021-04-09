["Aaron Whitmer", "Connie Chung", "betsy birkey", "Daniel Webster"]



def name_hasher(name)
  name_hash = {}
  name.split("").map{|char| name_hash[char] = char}
  name_hash
end

first_hash_array = [first_name_hash = name_hasher("Aaron Whitmer"),
second_name_hash = name_hasher("betsy birkey"),
third_name_hash = name_hasher("Aron Whitm"),
fourth_name_hash = name_hasher("Donna Summers"),
fifth_name_hash = name_hasher("AaronnWhittmer"),
sixth_name_hash = name_hasher("aaron whitmer"),
seventh_name_hash = name_hasher("erin Whitmer"),
eigth_name_hash = name_hasher("Keith Urban"),
ninth_name_hash = name_hasher("Alan Whitman"),
tenth_name_hash = name_hasher("Aro Hitmann"),
eleventh_name_hash = name_hasher("Aaren Widmer")]

p "This is my hash_array"
 first_search =  name_hasher("Aaron Whitmer")

 def hash_name_compare(search, data_array)
   matches = []
   data_array.each do |hash|
   fudge_width = search.merge(hash).length - search.length
   fudge_width <= 0 ? matches << "#{hash.keys.join(",")}: #{fudge_width}" : next
    end
    matches
  end
puts "_____________________________________________"
  results = hash_name_compare(first_search, first_hash_array)
puts "The results are in"
  puts results
  puts "_____________________________________________"
puts ""
puts ""

puts first_name_hash
puts second_name_hash
puts third_name_hash

first_length = first_name_hash.length
puts second_name_hash.length
puts third_name_hash.length

puts first_name_hash.merge(second_name_hash)
puts first_name_hash.merge(third_name_hash)

puts first_name_hash.merge(second_name_hash).length - first_length
puts first_name_hash.merge(third_name_hash).length - first_length
puts first_name_hash.merge(fourth_name_hash).length - first_length
puts first_name_hash.merge(fifth_name_hash).length - first_length
puts first_name_hash.merge(sixth_name_hash).length - first_length
puts first_name_hash.merge(seventh_name_hash).length - first_length
puts first_name_hash.merge(eigth_name_hash).length - first_length
puts first_name_hash.merge(ninth_name_hash).length - first_length
puts first_name_hash.merge(tenth_name_hash).length - first_length
puts first_name_hash.merge(eleventh_name_hash).length - first_length

array = ["Aaron", "Betsy", "Esme"]

name = "Aaron"
p name.downcase

#
# def input_catcher(search, database)
#   name_hasher
# end
#
#
# def name_file(name)
#   File.open(name + ".txt", "w")
# end
#
# name_file("test_file_1")
# name_file("sexy_file")
#
# name_file("secret_file")
#
# name_file("this is awesome!")
