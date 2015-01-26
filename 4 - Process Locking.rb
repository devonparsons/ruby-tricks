# Title: There Can Be Only One
# Comment: Use a tricky lock to make your script more exclusive
# Credit: Ara T. Howard
# Invocation: `ruby __FILE__`, and in another terminal, `ruby __FILE__`
# Transcript:

DATA.flock(File::LOCK_EX | File:: LOCK_NB) or abort "Already running"

trap("INT", "EXIT")

puts "Running"
loop do 
  sleep
end
  
__END__
DO NOT DELETE: used for locking