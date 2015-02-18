# Comment: If you have a ton of methods that are all very similar, you can define them all without repeating yourself

class Foo
  def initialize
    super
    [:first,:second,:third].each do |method|
       self.class.send(:define_method, method) do |argument|
        do_work(method, argument)
      end
    end
  end

  def do_work (one, two)
    puts "#{one} #{two}"
  end
end

foo = Foo.new

puts "Methods: #{foo.methods[0..7].join("\n")}"
puts "..." 
foo.first("The first method!")
foo.second("And the second!")
foo.third("Finally, the third!")
