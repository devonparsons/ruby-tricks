require 'rubygems'
require 'bundler/setup'
require_relative 'lib/Invoker'

def welcome
  puts "Welcome to ruby-tricks!"
  puts "At any time, the command 'help' will give you list of available commands. "
  puts "Use 'help' or 'start' to begin the tour:  "
end

def main
  ENV["mode"] = "run"
  puts ENV["project_path"]
  welcome
  invoker = Invoker.new
  invoker.run
end

ENV["project_path"] = Dir.pwd.to_s
puts ENV["project_path"]
puts ENV["mode"]
main unless ENV["mode"] == "test"
