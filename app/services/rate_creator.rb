class RateCreator
  
  def self.build(value, submission_id, user_id)
    submission = Submission.find(submission_id)
    user = User.find(user_id)
    new.call(value, submission, user)
  end

  def call(value, submission, user)
    rate = Rate.new({ value: value, submission: submission, user: user })

    if RateChecker.new.user_has_already_rated?(submission.id, user.id)
      rate.errors.add(:user_id, 'One user is not allowed to rate same submission more than once')
    else
      rate.save
    end
  end
end
