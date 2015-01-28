# Comment: this is my comment
# Disclaimer: There is no attr_accessor for this, so this program will crash right at the end
# Continued:  But that's because I asked for something that doesn't exist, not because I had a
# Finally:    comment that looked like an attribute to parse but wasn't specified

class Trick
  attr_accessor :title, :comment, :difficulty

  def parse_attributes(filename)
    File.readlines(filename).each do |line|
      self.method($1.downcase+"=").call($2) if line =~ /^# (\w+): (.*)/ && self.methods.map{|m|m.to_s}.include?($1.downcase)
    end
  end

  def initialize(filename)
    set_defaults(filename)
    parse_attributes(filename)
  end

  def set_defaults(filename)
    @title = "#{filename}"
    @comment = ""
    @difficulty = "Unspecified"
  end
end

this_trick = Trick.new("invoker.rb")
puts "title: #{this_trick.title}"
puts "comment: #{this_trick.comment}"
puts "difficulty: #{this_trick.difficulty}"
