# Comment: You can iterate through any number of Enumerables in lockstep

e = {
  numbers:   1..10,
  letters:   %w(a b c d e f g h i j),
  notes:     %w(do re mi fa so la ti do),
  phonetic:  %w(alpha bravo charlie delta echo),
  rainbow:   %w(red orange yellow green blue indigo violet)
}

# Titles
puts e.keys.map{|k|k.capitalize}.join(" ")
# Values
e[:numbers].zip(*e.values[1..-1]).each do |layer|
  layer.zip(e.keys).each do |node|
    print node[0].to_s.rjust(node[1].length), " "
  end
  puts 
end

