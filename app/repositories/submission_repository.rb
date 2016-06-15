class SubmissionRepository
  ACCEPTED_THRESHOLD = Submission::REQUIRED_RATES_NUM

  def accepted
    Submission.select { |submission| accepted?(submission, ACCEPTED_THRESHOLD) }
  end

  private

  def accepted?(submission, threshold)
    average_rate(submission) >= threshold
  end

  def average_rate(submission)
    rates = submission.rates
    if rates.count == 0
      0
    else
      rates.sum(:value).to_f  / rates.count
    end
  end
end
