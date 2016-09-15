class SubmissionPresenter < SimpleDelegator
  def initialize(submission, rates, submission_repository)
    super(submission)
    @rates = rates
    @submission_repository = submission_repository
  end

  def average_rate
    average_rate.round(2) if rated?
  end

  def rates_count
    @rates.count
  end

  def created_at
    submission.created_at.strftime("%m-%d-%Y")
  end

  def next_to_rate
    @submission_repository.next_to_rate(submission.created_at)
  end

  def previous_to_rate
    @submission_repository.previous_to_rate(submission.created_at)
  end

  def submission
    __getobj__
  end
end
