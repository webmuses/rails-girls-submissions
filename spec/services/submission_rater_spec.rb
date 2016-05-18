require 'rails_helper'

RSpec.describe SubmissionRater do
  describe '#set_rate' do
    it 'creates and saves a new rate in the db' do
      submission_rater = SubmissionRater.new
      submission = FactoryGirl.create(:submission)
      user = FactoryGirl.create(:user)
      expect(submission_rater.set_rate(1, submission.id, user.id)).to equal(true)
      expect(Rate.where(value: 1, submission_id: submission.id, user_id: user.id).first).not_to be_nil
    end
  end
end
