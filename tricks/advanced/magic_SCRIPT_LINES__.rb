# Number: 10
# Title: Inspecting the Source
# Comment: Initializing SCRIPT_LINES__ to an empty hash will fill it with all files 
# Comment: required from that point forward
# Credit: Eric Hodel
# Invocation: natural
# Transcript:

SCRIPT_LINES__ = {}

require_relative "snippit"
puts "Requiring snippit"
puts "Showing loaded code:"

SCRIPT_LINES__.each do |file, lines|
  puts "File: #{file}"
  puts "Code:"
  lines.each {|line| puts "  #{line}" }
  puts
end
