class String
  def to_lower
    self.downcase
  end

  def to_lower!
    self[0..-1] = self.downcase
  end
end


def list_global_shorthands
  puts "$*===ARGV: |#{$*===ARGV}|"

end
