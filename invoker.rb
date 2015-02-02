require_relative 'Trick'
require_relative 'ruby-util'

class Invoker
  attr_accessor :input_manager

  def set_trick(difficulty, trick)
    @current_trick = Trick.new(difficulty, trick)
  end

  def invoke(file)
    # Capture stdout
    $stdout = StringIO.new('','w')
    @current_trick.run
  ensure
    $stdout = STDOUT
  end


end

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
