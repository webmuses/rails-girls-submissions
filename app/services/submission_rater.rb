class SubmissionRater
  def create_rate(value, submission_id, user_id)
    submission = Submission.find(submission_id)
    user = User.find(user_id)

    rate = Rate.new({ value: value, submission: submission, user: user })
    rate.save
  end

  def user_has_already_rated?(submission_id, user_id)
    submission = Submission.find(submission_id)

    submission.rates.any? { |rate| rate.user_id == user_id }
  end
end
