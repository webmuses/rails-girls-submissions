class Csv
  attr_reader :file, :properties

  def initialize(file, properties = nil)
    @file = file
    @properties = properties
  end
end
