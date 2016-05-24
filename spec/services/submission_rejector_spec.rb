require 'rails_helper'

RSpec.describe SubmissionRejector do
  describe '#reject?' do
    it 'returns false by default' do
      submission_rejector = SubmissionRejector.new([])
      submission = FactoryGirl.create(:submission)
      expect(submission_rejector.reject?(submission.id)).to equal(false)
    end
  end
end
