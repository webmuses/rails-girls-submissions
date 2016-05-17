class SubmissionRater
  def set_rate(value, submission_id, user_id)
    submission = Submission.find(Integer(submission_id))
    user = User.find(Integer(user_id))
    rate = Rate.new({ value: value, submission: submission, user: user })
    rate.save
  end
end
