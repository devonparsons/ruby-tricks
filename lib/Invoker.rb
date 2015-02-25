require_relative 'Trick'
require_relative 'InputManager'
require_relative 'Menu'

class Invoker
  attr_accessor :input_manager, :current_trick

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
    retval = nil
    # Capture stdout
    $> = StringIO.new('','r+')
    @current_trick.run
    case ENV["mode"]
    when "run"
      $>.rewind
      $>.each_line {|l| STDOUT.puts l.chomp}
    when "test"
      $>.rewind
      retval = $>.readlines.map{|l|l.chomp}
    end
  ensure
    $>.close
    $> = STDOUT
  end
end
