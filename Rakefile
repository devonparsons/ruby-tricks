task default: %w[test]

ENV["project_path"] = Dir.pwd.to_s

task :test do
  ENV["mode"] = "test"
  require ENV["project_path"] + "/test/test_helper"
  ruby "test/beginner_test.rb"
  ruby "test/intermediate_test.rb"
end