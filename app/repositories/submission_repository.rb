class SubmissionRepository
  ACCEPTED_THRESHOLD = 3
  WAITLIST_THRESHOLD = 2

  def accepted
    Submission.joins(:rates).group('submissions.id').having('avg(value) >= ?', ACCEPTED_THRESHOLD).to_a
  end

  def waitlist
    Submission.joins(:rates).group('submissions.id').having('avg(value) < ? AND avg(value) >= ?', ACCEPTED_THRESHOLD,
    WAITLIST_THRESHOLD).to_a
  end

  def unaccepted
    Submission.joins(:rates).group('submissions.id').having('avg(value) < ?', WAITLIST_THRESHOLD).to_a
  end
end
