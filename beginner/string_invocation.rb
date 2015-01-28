# Comment: Using the string shorthand for variables invokes the 'to_s' method. Classes without 'to_s' defined return the instance descriptor

class Foo
  def initialize(name)
    @name = name
  end

  def to_s
    "!@\#$%^&*()_+ #@name +_)(*&^%$\#@!"
  end
end

class Bar
  def initialize(name)
    @name = name
  end
end

foo = Foo.new("foo for thought")
bar = Bar.new("bar naked ladies")

puts "foo: #{foo}"
puts "bar: #{bar}"