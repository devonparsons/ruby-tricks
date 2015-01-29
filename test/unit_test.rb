# require_relative "../ruby-tricks"
require "test/unit"

class TestRubyTricks < Test::Unit::TestCase
  def test_simple
    assert(true)
  end

  def test_beginner_method_chaining
    response = `ruby beginner/method_chaining.rb`
    assert_match(/Five vowels: UOIII/, response)
    assert_match(/Five vowels: UOOOO/, response)
    assert_match(/Five vowels: UOIEA/, response)
  end
end