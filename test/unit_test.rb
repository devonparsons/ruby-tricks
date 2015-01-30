# Coveralls must remain at the very top!
require 'coveralls'
Coveralls.wear!

require "test/unit"

class TestRubyTricks < Test::Unit::TestCase
  def test_beginner_method_chaining
    expected = [
      "Five vowels: UOIII",
      "Five vowels: UOOOO",
      "Five vowels: UOIEA"
    ]
    assert_expected(`ruby beginner/method_chaining.rb`, expected)
  end

  def test_beginner_reliable_returning
    expected = [
      "In ruby, everything returns a value",
      "puts returns a NilClass: ",
      "sleep returns a Fixnum: 1",
      "method declaration returns a Symbol: describe"
    ]
    assert_expected(`ruby beginner/reliable_returning.rb`,expected)
  end

  def test_beginner_string_interpolation_shortcuts
    expected = [
      "My name is Foo Name",
      "Foos are size 4",
      "Filename: beginner/string_interpolation_shortcuts.rb",
    ]
    assert_expected(`ruby beginner/string_interpolation_shortcuts.rb`, expected)
  end
end

def assert_expected(response, expected)
  responses = response.split("\n")
  expected.each do |line|
    assert_equal(line, responses.shift)
  end
  assert_equal([],responses)
end