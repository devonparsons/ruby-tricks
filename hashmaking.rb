# Comment: I want to be able to parse out these
# Comment: multi-line comments in my code in a nice,
# Comment: Ruby friendly way

hash = {}
DATA.rewind
DATA.lines do |line|
  if line=~/^# (\w+): (.*)/
    hash[$1] = hash[$1].to_s + "#$2\n"
  end
end

puts hash["Comment"]

__END__