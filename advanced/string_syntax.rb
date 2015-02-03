# Comment: There are a ton of ways to create a string in ruby.

puts "Double quote, supports interpolation #{2+2} and escaping \x21"
puts 'Single quote, cannot interpolate #{2+2} or escape \x21'
puts %Q(Emulates double quotes)
puts %q(Emulates single quotes)
puts %^Carets^
puts %.Periods.
puts %\You can really just use any symbols for this\
puts Object.new

