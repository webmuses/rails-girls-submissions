class SubmissionRater

  def set_rate(rate, submission_id, current_user_id)
    @rate = Rate.new({ value: rate, submission_id: submission_id, user_id: current_user_id })
    @rate.save!
  end
end
