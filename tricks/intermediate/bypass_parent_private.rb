# Comment: Careless child classes can expose their parent's private methods

class Parent
  attr_reader :my_variables

  private

  def foo
    puts "I'm private"
  end

  def dangerous_operation(*args)
    @my_variables = args
  end
end

class NiceChild < Parent
end

class NaughtyChild < Parent
  def foo
    super
  end

  def dangerous_operation(*args)
    super
  end
end

puts "Nice child:"
nice = NiceChild.new
begin
  nice.foo
rescue StandardError => e
  puts "Oops! #{e}"
end

begin
  nice.dangerous_operation("kill-signal", %w(Malicious Data))
rescue StandardError => e
  puts "Oops! #{e}"
end
puts "My variables: #{nice.my_variables}"


puts "\nNaughty child:"
naughty = NaughtyChild.new
naughty.foo
naughty.dangerous_operation("kill-signal", %w(Malicious Data))
puts "My variables: #{naughty.my_variables}"
