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

  def test_intermediate_bypass_parent_private
    @invoker.current_trick= Trick.new("intermediate/bypass_parent_private.rb")
    response = @invoker.invoke
    expected = [
      "Nice child:",
      ["Oops! private method `foo' called for CLASSNAME", "NiceChild"],
      ["Oops! private method `dangerous_operation' called for CLASSNAME", "NiceChild"],
      "My variables: ",
      "",
      "Naughty child:",
      "I'm private",
      'My variables: ["kill-signal", ["Malicious", "Data"]]'
    ]
    assert_expected(response[0], expected[0])
    assert_object_line(response[1], *expected[1])
    assert_object_line(response[2], *expected[2])
    assert_expected(response[3..-1], expected[3..-1])
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

