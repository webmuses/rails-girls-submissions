class Result
  attr_reader :object, :success, :errors

  def initialize(object, success, errors = nil)
    @object = object
    @success = success
    @errors = errors
  end
end
