# Comment: Methods automatically return the last statement they evaluated before exiting
# Invocation: natural

def return_array
  [2,3,4]
end

def return_modified_string(string)
  string.upcase!
  string.reverse!
  string.succ.succ
end

def explicitly_return_num(num)
  return num * 15
  0
end

puts return_array
puts return_modified_string "petal"
puts explicitly_return_num (3)