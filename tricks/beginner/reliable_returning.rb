# Comment: In Ruby, absolutely everything returns something else.
# Invocation: natural

def_return = def describe(call, var)
  puts "#{call} returns a #{var.class}: #{var}"
end

puts_return = puts "In ruby, everything returns a value"
describe("puts", puts_return)

sleep_return = sleep(1)
describe("sleep", sleep_return)

describe("method declaration", def_return)
