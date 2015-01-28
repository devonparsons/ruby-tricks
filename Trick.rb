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