class SubmissionRepository

  def rejected
    Submission.where(rejected: true)
  end

  def rated
    with_rates_if_any.having('count(*) >= ?',  Settings.get.required_rates_num).to_a
  end

  def to_rate
    with_rates_if_any.having('count(*) < ?', Settings.get.required_rates_num).to_a
  end

  def accepted
    with_rates_if_any.having('count(*) >= ? AND avg(value) >= ?', Settings.get.required_rates_num,
      Settings.get.accepted_threshold).to_a
  end

  def waitlist
    with_rates_if_any.having('count(*) >= ? AND avg(value) < ? AND avg(value) >= ?',
      Settings.get.required_rates_num, Settings.get.accepted_threshold, Settings.get.waitlist_threshold).to_a
  end

  def unaccepted
    with_rates_if_any.having('avg(value) < ?', Settings.get.waitlist_threshold).to_a + rejected
  end

  private

  def with_rates_if_any
    Submission.where(rejected: false).joins("LEFT JOIN rates ON submissions.id = rates.submission_id").
      group('submissions.id')
  end
end
