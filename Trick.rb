class Trick
  attr_reader :title, :difficulty, :filename, :invocation, :contents, :path, :comment

  public

  def initialize(filename)
    @filename = filename
    set_defaults
    parse_file
  end

  def run
    load(@filename,true) # if @invocation == "natural\n"
  end

  def code
    puts "Contents of #@title:"
    puts "\n#@contents\n"
  end

  def describe
    puts "Title: #{@title}"
    puts "Comment: #{@comment}"
    puts "Difficulty: #{@difficulty}"
  end
  
  private

  def set_defaults
    @difficulty, @title = @filename.split("/").map{|s|s.capitalize.gsub(/_/," ")}
    @comment = ""
    @contents = []
    @path = (File.dirname(__FILE__) + "/#@filename").split("/")[1..-1]
  end

  def parse_file
    File.readlines(@filename).each do |line|
      # Parse the meta tags at the top into the appropriate attr_accessors. Allows multi-line tags. Doesn't crash on unknown meta tag. Parse other lines into code contents.
      line =~ /^# (\w+): (.*?)\n$/ && methods.map{|m|m.to_s}.include?($1.downcase) ? method($1.downcase+"=").(method($1.downcase).().to_s + "#$2\n") : @contents << line
    end
  end
end