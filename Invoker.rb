require_relative 'Trick'
require_relative 'ruby-util'

class Invoker
  attr_accessor :input_manager, :current_trick, :menu_state

  def initialize
    @input_manager = InputManager.new
    @menu_state = :menu
  end

  def run

  end

  def navigate
    response = @input_manager.get
  end


  def invoke
    # Capture stdout
    $> = StringIO.new('','r+')
    @current_trick.run
    case $ENV
    when :run
      $>.rewind
      $>.each_line {|l| STDOUT.puts l.chomp}
    when :test
      $>.rewind
      $>.readlines.map{|l|l.chomp}
    end
  ensure
    $>.close
    $> = STDOUT
  end
end
