require_relative 'Trick'
require_relative 'ruby-util'

# class Invoker
#   attr_accessor :input_manager


#   def invoke(file)
#     this_trick = Trick.new("beginner/method_chaining.rb")
    

#   end
# end

this_trick = Trick.new("beginner/method_chaining.rb")
puts
this_trick.describe
puts
this_trick.run
puts
this_trick.code
puts
puts "running again"
this_trick.run
# puts "difficulty: #{this_trick.difficulty}" # crashes
