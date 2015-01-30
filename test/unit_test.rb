# Coveralls must remain at the very top!
require 'coveralls'
Coveralls.wear!

require "test/unit"

class TestRubyTricks < Test::Unit::TestCase
  def test_beginner_method_chaining
    response = `ruby beginner/method_chaining.rb`.split("\n")
    assert_equal("Five vowels: UOIII", response.shift)
    assert_equal("Five vowels: UOOOO", response.shift)
    assert_equal("Five vowels: UOIEA", response.shift)
    assert_equal([], response)
  end

  def test_beginner_reliable_returning
    response = `ruby beginner/reliable_returning.rb`.split("\n")
    assert_equal("In ruby, everything returns a value", response.shift)
    assert_equal("puts returns a NilClass: ", response.shift)
    assert_equal("sleep returns a Fixnum: 1", response.shift)
    assert_equal("method declaration returns a Symbol: describe", response.shift)
    assert_equal([], response)
  end

  def test_beginner_string_interpolation_shortcuts
    response = `ruby beginner/string_interpolation_shortcuts.rb`.split("\n")
    assert_equal("My name is Foo Name", response.shift)
    assert_equal("Foos are size 4", response.shift)
    assert_equal("Filename: beginner/string_interpolation_shortcuts.rb", response.shift)
    assert_equal([], response)
  end
end