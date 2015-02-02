require_relative 'Trick'
require_relative 'ruby-util'

class Invoker
  attr_accessor :input_manager, :current_trick

  def invoke
    # Capture stdout
    $> = StringIO.new('','r+')
    @current_trick.run
    case $ENV
    when :run
      $>.rewind
      $>.each_line {|l| STDOUT.puts l.chomp}
    when :test
      # $>.rewind
      # $>.each_line {|l| STDOUT.puts l.chomp}
      $>.rewind
      $>.readlines.map{|l|l.chomp}
    end
  ensure
    $>.close
    $> = STDOUT
  end
end
