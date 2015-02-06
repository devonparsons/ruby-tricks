task default: %w[test]

ENV["project_path"] = Dir.pwd.to_s

task :test do
  ENV["mode"] = "test"
  ruby "test/beginner_test.rb"
end