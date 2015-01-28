# Comment: this is my comment
# Comment: it is a multi-line comment
# Disclaimer: There is no attr_accessor for this, so this program will crash right at the end
# Continued:  But that's because I asked for something that doesn't exist, not because I had a
# Finally:    comment that looked like an attribute to parse but wasn't specified

class Trick
  attr_accessor :title, :comment, :difficulty, :filename

  def parse_attributes
    File.readlines(@filename).each do |line|
      # Parse the meta tags at the top into the appropriate attr_accessors. Allows multi-line tags. Doesn't crash on unknown meta tag.
      method($1.downcase+"=").call(method($1.downcase).call + "#$2\n") if line =~ /^# (\w+): (.*)/ && methods.map{|m|m.to_s}.include?($1.downcase)
    end
  end

  def initialize(filename)
    @filename = filename
    set_defaults
    parse_attributes
  end

  def set_defaults
    @title = "#@filename"
    @comment = ""
    @difficulty = "Unspecified"
  end
end

this_trick = Trick.new("invoker.rb")
puts "title: #{this_trick.title}"
puts "comment: #{this_trick.comment}"
puts "difficulty: #{this_trick.difficulty}"


