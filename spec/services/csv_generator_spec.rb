require 'rails_helper'

RSpec.describe CsvGenerator do
  describe '#call' do
    subject { described_class.new.call(submissions, filename).file }

    let!(:submission_) { FactoryGirl.build(:submission) }
    let!(:submissions) do
      submissions = []
      submissions << submission_ << FactoryGirl.build(:submission)
    end
    let!(:filename) { "submissions.csv" }

    it { expect(subject).to include submission_.email }
  end
end
