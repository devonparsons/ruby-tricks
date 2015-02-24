# Comment: Ruby honors the convention of using `_` as a placeholder for garbage data

class ThirdPartyWorker
  attr_reader :title, :sizes, :details
  def initialize(title, sizes = [], details = {})
    @title = title
    @sizes = sizes
    @details = details
  end
end

# None of my implementations of workers care about the `size` or `detail` attribute that workers usually have

class WorkingWorker < ThirdPartyWorker
  def initialize(title, _, _)
    super(title, nil, nil)
  end
end

# UninterpretableWorker doesn't even make it past the interpreter and cannot be included.

# class UninterpretableWorker <  ThirdPartyWorker
#   def initialize(title, unused, unused)
#     super(title)
#   end
# end

# UglyWorker works, but rubocop warns about unused variables
# W: Unused method argument - sizes
# W: Unused method argument - details

class UglyWorker < ThirdPartyWorker
  def initialize(title, sizes, details)
    super(title, nil, nil)
  end
end

# CarelessWorker initially appears to work but can't be initialized like any other worker

class CarelessWorker < ThirdPartyWorker
  def initialize(title)
    super(title, nil, nil)
  end
end

class BlissfullyUnawareWorkerCreator
  def self.create(worker_class)
    worker = worker_class.new("valueable text", [12, 32], name: "foo", location: "Florida")

    puts "Title: #{worker.title.inspect}"
    puts "Sizes: #{worker.sizes.inspect}"
    puts "Details: #{worker.details.inspect}"
  rescue StandardError => e
    puts "Error! #{e}"
  end
end

puts "Create a ThirdPartyWorker:"
BlissfullyUnawareWorkerCreator.create(ThirdPartyWorker)

puts "\nCreate a WorkingWorker:"
BlissfullyUnawareWorkerCreator.create(WorkingWorker)

# puts "\nCreate an UninterpretableWorker:"
# BlissfullyUnawareWorkerCreator.create(UninterpretableWorker)

puts "\nCreate an UglyWorker:"
BlissfullyUnawareWorkerCreator.create(UglyWorker)

puts "\nCreate a CarelessWorker:"
BlissfullyUnawareWorkerCreator.create(CarelessWorker)
