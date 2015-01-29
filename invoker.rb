# Comment: this is my comment
# Comment: it is a multi-line comment
# Disclaimer: There is no attr_accessor for this, so this program will crash right at the end
# Continued:  But that's because I asked for something that doesn't exist, not because I had a
# Finally:    comment that looked like an attribute to parse but wasn't specified

require_relative 'Trick'

this_trick = Trick.new("invoker.rb")
puts "title: #{this_trick.title}"
puts "comment: #{this_trick.comment}"
# puts "difficulty: #{this_trick.difficulty}" # crashes



