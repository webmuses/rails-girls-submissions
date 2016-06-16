class SubmissionRepository
  ACCEPTED_THRESHOLD = 3
  WAITLIST_THRESHOLD = 2

  def accepted
    Submission.select { |submission| accepted?(submission, ACCEPTED_THRESHOLD) }
  end

  def waitlist
    Submission.select { |submission| waitlist?(submission, ACCEPTED_THRESHOLD, WAITLIST_THRESHOLD) }
  end

  def unaccepted
    Submission.select { |submission| unaccepted?(submission, WAITLIST_THRESHOLD) }
  end

  private

  def accepted?(submission, accepted_threshold)
    average_rate(submission) >= accepted_threshold
  end

  def waitlist?(submission, accepted_threshold, waitlist_threshold)
    average_rate(submission) < accepted_threshold && average_rate(submission) >= waitlist_threshold
  end

  def unaccepted?(submission, waitlist_threshold)
    average_rate(submission) < waitlist_threshold
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
