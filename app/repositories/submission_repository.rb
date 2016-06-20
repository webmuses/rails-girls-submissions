class SubmissionRepository
  ACCEPTED_THRESHOLD = 3
  WAITLIST_THRESHOLD = 2
  REQUIRED_RATES_NUM = 3

  def rejected
    Submission.where(rejected: true)
  end

  def rated
    with_rates_if_any.having('count(*) >= ?', REQUIRED_RATES_NUM).to_a
  end

  def to_rate
    with_rates_if_any.having('count(*) < ?', REQUIRED_RATES_NUM).to_a
  end

  def accepted
    with_rates_if_any.having('count(*) >= ? AND avg(value) >= ?', REQUIRED_RATES_NUM, ACCEPTED_THRESHOLD).to_a
  end

  def waitlist
    with_rates_if_any.having('count(*) >= ? AND avg(value) < ? AND avg(value) >= ?',
      REQUIRED_RATES_NUM, ACCEPTED_THRESHOLD, WAITLIST_THRESHOLD).to_a
  end

  def unaccepted
    with_rates_if_any.having('avg(value) < ?', WAITLIST_THRESHOLD).to_a + rejected
  end

  private

  def with_rates_if_any
    Submission.where(rejected: false).joins("LEFT JOIN rates ON submissions.id = rates.submission_id").
      group('submissions.id')
  end
end
