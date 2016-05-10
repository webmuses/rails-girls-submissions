class SubmissionRater
  # def initialize(submission)
  #   @submission = submission
  # end

  def set_rate(aa,bb,cc)
    # @rate = @submission.rates.create(rate: :rate, submission_id: :submission_id, user_id: :current_user)
    @rate = Rate.new({ value: :rate, submission_id: :submission_id, user_id: :current_user })
    @rate.save!
  end
end
