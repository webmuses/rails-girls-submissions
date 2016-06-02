class RateCreator
  def self.build(value, submission_id, user_id)
    submission = Submission.find(submission_id)
    user = User.find(user_id)
    new.call(value, submission, user)
  end

  def call(value, submission, user)
    Rate.create({ value: value, submission: submission, user: user })
  end
end
