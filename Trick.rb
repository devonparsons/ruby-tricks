class Trick
  attr_accessor :title, :comment, :difficulty, :filename

  def parse_attributes
    File.readlines(@filename).each do |line|
      # Parse the meta tags at the top into the appropriate attr_accessors. Allows multi-line tags. Doesn't crash on unknown meta tag.
      method($1.downcase+"=").(method($1.downcase).() + "#$2\n") if line =~ /^# (\w+): (.*)/ && methods.map{|m|m.to_s}.include?($1.downcase)
    end
  end

  def initialize(filename)
    @filename = filename
    set_defaults
    parse_attributes
  end

  def set_defaults
    @difficulty, @title = @filename.split("/").map{|s|s.capitalize}
    @comment = ""
    path = (File.dirname(__FILE__) + "/#@filename").split("/")[1..-1]
    puts "path: #{path}"
  end

  def describe
    puts "Title: #{@title}"
    puts "Comment: #{@comment}"
    puts "Difficulty: #{@difficulty}"
  end
end