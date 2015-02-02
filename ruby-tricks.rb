require 'rubygems'
require 'bundler/setup'

def welcome
  puts "Welcome to ruby-tricks!"
  puts "At any time, the command 'help' will give you list of available commands. "
  puts "Use 'help' or 'start' to begin the tour:  "
end

def navigate
  response = gets.chomp.downcase
end

def main
  $ENV = :run
  welcome
  navigate
end

main unless $ENV = :test

# Commands:
# 'help' list all commands
# 'beginner' list beginner tricks
# 'intermediate' list intermediate tricks
# 'advanced' list advanced tricks
# 'expert' list expert tricks
# 'start' begin tour at beginner 1
# '' move to next logical stage
# 'run NAME' run 