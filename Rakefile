task default: %w[test]

ENV["project_path"] = Dir.pwd.to_s

task :test do
  ENV["mode"] = "test"
  ruby "test/unit_test.rb"
end