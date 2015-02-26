# Comment: The super keyword intelligently passes up parameters

class Foo
  def initialize(a = nil, b = nil, c = nil)
    yield if block_given?
    puts "a:#{a} b:#{b} c:#{c}\n\n"
  end
end

class Bar < Foo
  def initialize(a, b, c)
    puts "Bar"
    puts "Pass up everything"
    super
  end
end

class Car < Foo
  def initialize(a, b, _)
    puts "Car"
    puts "Not passing up c"
    super(a, b)
  end
end

class Dar < Foo
  def initialize(a, b, c)
    puts "Dar"
    puts "Pass up everything, even if it's modified"
    a = "definitely dar"
    b.gsub!(/2/, "two")
    super
  end
end

class Ear < Foo
  def initialize(_, _, _, &d)
    puts "Ear"
    puts "Even pass up the block: #{d}"
    super
  end
end

class Far < Foo
  def initialize
    puts "Far"
    puts "Nothing to pass!"
    super
  end
end

class Gar < Foo
  def initialize(_, _, _)
    puts "Gar"
    puts "Pass nothing on purpose"
    super()
  end
end

Foo.new("foo", "2", 3)
Bar.new("bar", "2", 3)
Car.new("car", "2", 3)
Dar.new("dar", "2", 3)
Ear.new("ear", "2", 3) { puts "the block!" }
Far.new
Gar.new("gar", "2", 3)
