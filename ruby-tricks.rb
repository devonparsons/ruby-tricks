require 'rubygems'
require 'bundler/setup'
require_relative 'lib/Invoker'

def welcome
  puts "Welcome to ruby-tricks!"
  puts "At any time, the command 'help' will give you list of available commands. "
  puts "Use 'help' or 'start' to begin the tour:  "
end

def main
  puts Dir.pwd
  ENV["mode"] = "run"
  ENV["project_path"] = Dir.pwd.to_s
  puts ENV["project_path"]
  welcome
  invoker = Invoker.new
  invoker.run
end

puts ENV["mode"]
main unless ENV["mode"] == "test"





# Commands:
# 'help' list all commands
# 'beginner' list beginner tricks
# 'intermediate' list intermediate tricks
# 'advanced' list advanced tricks
# 'expert' list expert tricks
# 'start' begin tour at beginner 1
# '' move to next logical stage
# 'run NAME' run 