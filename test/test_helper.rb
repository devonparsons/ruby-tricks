def get_natural_response (filename)
  invoker = Invoker.new
  invoker.current_trick = Trick.new(filename)
  invoker.invoke
end

def assert_expected(response, expected)
  # responses = response.split("\n")
  response, expected = Array(response), Array(expected)
  expected.each do |line|
    assert_equal(line, response.shift)
  end
  assert_equal([],response)
end

def assert_object_line(response, expected, classname)
    assert_match(Regexp.new(expected.gsub(/CLASSNAME/,"#<#<Module:0x[0-9a-f]{14}>::#{classname}:0x[0-9a-f]{14}>")), response)
end