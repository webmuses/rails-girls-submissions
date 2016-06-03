class RateChecker
  def user_has_already_rated?(submission_id, user_id)
    submission = Submission.find(submission_id)

    submission.rates.any? { |rate| rate.user_id == user_id }
  end
end
