class Result
  attr_reader :object, :success

  def initialize(object, success)
    @object = object
    @success = success
  end
end
