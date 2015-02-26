# Comment: You can iterate through any number of Enumerables in lockstep
# Comment: Note that the length is limited to the zip initiator's length

data = {
  months:    %w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec),
  letters:   %w(a b c d e f g h i j k l m n o p q r s t u v w x y z),
  numbers:   1..10,
  phonetic:  %w(alpha bravo charlie delta echo),
  rainbow:   %w(red orange yellow green blue indigo violet),
  notes:     %w(do re mi fa so la ti).cycle.take(8),
  evens:     (2..1_000).step(2),
}

# Titles
puts data.keys.map(&:capitalize).join(" ")

# Values
puts (data.first[1].zip(*data.values[1..-1]).map do |layer|
  (layer.zip(data.keys).map do |value, header|
    value.to_s.rjust(header.length)
  end).join(" ")
end).join("\n")
