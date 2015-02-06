# Comment: Variables that start with any non-alphanumeric character do not need braces in string interpolation
# Comment: However they must be followed by a space or the end of the string
# Invocation: natural

class Foo
  @@foo_size = 4
  attr_accessor :name

  def introduce
    puts "My name is #@name"
    puts "Foos are size #@@foo_size"
  end
end

foo = Foo.new
foo.name = "Foo Name"
foo.introduce
puts "Line number of this line: #$NR"
