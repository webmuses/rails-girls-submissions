require 'rails_helper'

RSpec.describe SubmissionRater do
  describe '#create_rate' do
    it 'creates and saves a new rate in the db' do
      submission_rater = SubmissionRater.new
      submission = FactoryGirl.create(:submission)
      user = FactoryGirl.create(:user)
      expect(submission_rater.create_rate(1, submission.id, user.id)).to equal(true)
      expect(Rate.where(value: 1, submission_id: submission.id, user_id: user.id).first).not_to be_nil
    end

    describe '#user_has_already_rated?' do
      subject { described_class.new.user_has_already_rated?(submission.id, user.id) }

      context 'when the submmission has already been rated by the user' do
        let!(:submission) { FactoryGirl.create(:submission) }
        let!(:user) { FactoryGirl.create(:user) }

        it do
          submission.rates << Rate.new(user_id: user.id)
          expect(subject).to equal(true)
        end
      end

      context 'when the submmission has not been rated by the user yet' do
        let!(:submission) { FactoryGirl.create(:submission) }
        let!(:user) { FactoryGirl.create(:user) }

        it do
          submission.rates << Rate.new(user_id: (user.id + 1))
          expect(subject).to equal(false)
        end
      end
    end
  end
end
