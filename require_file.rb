"the quick brown fox jumped over the lazy dog".match(/(brown).*(dog)/)

puts $~.class
puts $~[1]
puts $1.class
puts $1
puts $2