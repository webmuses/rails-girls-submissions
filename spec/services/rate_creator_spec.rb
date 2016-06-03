require 'rails_helper'

RSpec.describe RateCreator do
  describe '#call' do

    it 'creates and saves a new rate in the db' do
      submission = FactoryGirl.create(:submission)
      user = FactoryGirl.create(:user)
      described_class.build(1, submission.id, user.id).call
      expect(Rate.where(value: 1, submission_id: submission.id, user_id: user.id).first).not_to be_nil
    end
  end
end
