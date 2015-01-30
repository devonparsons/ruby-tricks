class Trick
  attr_accessor :title, :comment, :difficulty, :filename, :invocation
  attr_reader :contents

  public

  def initialize(filename)
    @filename = filename
    set_defaults
    parse_attributes
  end

  def run
    load(@filename,true) if @invocation == "natural\n"
  end

  def code
    puts "Contents of #@title:"
    puts "\#\# BEGIN \#\#"
    puts @contents
  end

  def describe
    puts "Title: #{@title}"
    puts "Comment: #{@comment}"
    puts "Difficulty: #{@difficulty}"
  end
  
  private

  def set_defaults
    @difficulty, @title = @filename.split("/").map{|s|s.capitalize}
    @comment = ""
    @contents = []
    path = (File.dirname(__FILE__) + "/#@filename").split("/")[1..-1]
  end

  def parse_attributes
    File.readlines(@filename).each do |line|
      # Parse the meta tags at the top into the appropriate attr_accessors. Allows multi-line tags. Doesn't crash on unknown meta tag.
      line =~ /^# (\w+): (.*)/ && methods.map{|m|m.to_s}.include?($1.downcase) ? method($1.downcase+"=").(method($1.downcase).().to_s + "#$2\n") : contents << line
    end
    # TODO trim the newlines off the attributes
  end
end