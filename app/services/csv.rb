class Csv
  attr_reader :file, :properties

  def initialize(object, properties = nil)
    @file = file
    @properties = properties
  end
end
