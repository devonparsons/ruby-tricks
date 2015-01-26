# Title: Your Source File, The Database
# Comment: A dirty trick to carry some data with the code
# Credit: James Gray
# Invocation: natural
# Transcript:
# FIXME

pos = DATA.pos
list = DATA.readlines

if ARGV.empty?
  puts list.shift
else
  list.push(*ARGV)
end

DATA.reopen(__FILE__, "r+")
# Data.truncate(pos) #no method
puts DATA.methods
Data.seek(pos)
Data.puts list

__END__
Service-Oriented Design with Ruby and Rails
Practical Object-Oriented Design in Ruby