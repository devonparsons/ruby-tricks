# Comment: As a side effect of everything returning something, methods can be chained quite naturally and indefinitely

def four_sorted_capitalized_vowels(str)
  puts str.upcase
    .gsub(/[^AEIOU]/,"")
    .chars
    .sort
    .reverse
    .take(4)
    .join
    .rjust(17, "Four vowels: ")
end

four_sorted_capitalized_vowels("The rain in Spain falls mainly on the plains")
four_sorted_capitalized_vowels("O Romeo, Romeo, wherefore art thou Romeo?")
four_sorted_capitalized_vowels("Singular vowels ;)")