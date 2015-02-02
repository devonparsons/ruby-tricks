# Invocation: natural
# Comment: As a side effect of everything returning something, 
# Comment: methods can be chained quite naturally and indefinitely

def five_sorted_capitalized_vowels(str)
  puts str.upcase
    .gsub(/[^AEIOU]/,"")
    .chars
    .sort
    .reverse
    .take(5)
    .join
    .rjust(18, "Five vowels: ")
end

five_sorted_capitalized_vowels("The rains in Spain fall mainly on the umbrellas")
five_sorted_capitalized_vowels("O Romeo, Romeo, wherefore art thou Romeo?")
five_sorted_capitalized_vowels("Singular vowels")

