# Coveralls must remain at the very top!
require 'coveralls'
Coveralls.wear!

require "test/unit"
require "#{ENV["project_path"]}/test/test_helper"
require "#{ENV["project_path"]}/lib/Trick"
require "#{ENV["project_path"]}/lib/Invoker"

class RubyTricksTest < Test::Unit::TestCase

  attr_accessor :invoker

  def initialize (*args)
    super *args
    @invoker = Invoker.new
  end

  def test_beginner_method_chaining
    @invoker.current_trick= Trick.new("beginner/method_chaining.rb")
    response = @invoker.invoke
    expected = [
      "Five vowels: UOIII",
      "Five vowels: UOOOO",
      "Five vowels: UOIEA"
    ]
    assert_expected(response, expected)
  end

  def test_beginner_reliable_returning
    response = get_natural_response("beginner/reliable_returning.rb")
    expected = [
      "In ruby, everything returns a value",
      "puts returns a NilClass: ",
      "sleep returns a Fixnum: 1",
      "method declaration returns a Symbol: describe" # ruby 2.1.5?
      # "method declaration returns a NilClass: " # ruby 2.0.0?
    ]
    assert_expected(response,expected)
  end

  def test_beginner_string_interpolation_shortcuts
    response = get_natural_response("beginner/string_interpolation_shortcuts.rb")
    expected = [
      "My name is Foo Name",
      "Foos are size 4",
      "Line number of this line: 18",
    ]
    assert_expected(response, expected)
  end


  def test_beginner_string_to_s_invocation
    response = get_natural_response("beginner/string_to_s_invocation.rb")
    assert_equal("foo: hard_coded to_s foo for thought", response[0])
    assert_object_line(response[1], "bar: CLASSNAME", "Bar")
  end

  def test_beginner_method_returning
    response = get_natural_response("beginner/method_returning.rb")
    expected = [
      "2",
      "3",
      "4",
      "LATER",
      "45"
    ]
    assert_expected(response, expected)
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