# Comment: Since 1.9, the order of objects inserted into hashes is maintained

hash = { 0 => "first" }
arr = ["first"]
(1..100_000).each do |i|
  r = rand(10)
  hash[i] = r
  arr << r
end

5.times do
  puts hash.values == arr
end
