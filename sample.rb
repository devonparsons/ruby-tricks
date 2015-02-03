# (2..100).step(2).reverse_each do |i|
#   puts i
# end

require_relative 'ruby-util'

array = [0,1,2,3,4,5]

array.remove_while do |i| 
  i < 4
end 
puts array