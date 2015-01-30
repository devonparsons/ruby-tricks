# Comment: Child classes can expose their

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

nice = NiceChild.new
nice.foo rescue "Oops! Can't call foo"

begin
  nice.dangerous_operation
rescue StandardError => e
  puts "Oops! #{e}"
end

begin
  nice.my_variables = ["kill-signal", ["malicious","array"]]
rescue StandardError => e
  puts "Oops! #{e}"
end

naughty = NaughtyChild.new
naughty.foo
naughty.dangerous_operation("kill-signal",["malicious","array"])
puts naughty.my_variables