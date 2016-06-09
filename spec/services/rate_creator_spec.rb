require 'rails_helper'

RSpec.describe RateCreator do
  let!(:submission) { FactoryGirl.create(:submission) }
  let!(:user) { FactoryGirl.create(:user) }
  subject { described_class.build(1, submission.id, user.id) }

  it 'creates a new rate' do
    result = subject.call
    expect(Rate.where(value: 1, submission_id: submission.id, user_id: user.id).first).not_to be_nil
    expect(result.success).to be true
  end
end
