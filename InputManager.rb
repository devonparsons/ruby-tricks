class InputManager
  attr_reader :lines

  def initailize(feed = nil)
    @lines = feed
  end

  def get
    @lines.shift || $stdin.gets
  end
end