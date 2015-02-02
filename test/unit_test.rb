# Coveralls must remain at the very top!
require 'coveralls'
Coveralls.wear!

require "test/unit"
require_relative "../Trick"


class RubyTricksTest < Test::Unit::TestCase

  # invoker = Invoker.new(:test)

  def test_beginner_method_chaining
    trick = Trick.new("beginner/method_chaining")
    # response = Invoker.invoke(:beginner, :method_chaining)
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

# class InvokerTest < Test::Unit::TestCase
#   invoker = Invoker.new(:test)
#   def test_method_one
#     invoker.InputManager = InputManager.new(["begin","repeat","quit"])
#     invoker.menu
#     ...
#   end
# end 

def assert_expected(response, expected)
  responses = response.split("\n")
  expected.each do |line|
    assert_equal(line, responses.shift)
  end
  assert_equal([],responses)
end