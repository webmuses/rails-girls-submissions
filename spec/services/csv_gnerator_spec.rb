require 'rails_helper'

RSpec.describe CsvGenerator do
  describe '#to_csv' do
    subject { described_class.new.to_csv(submissions) }

    let!(:submission1) { FactoryGirl.build(:submission) }
    let!(:submissions) do
      submissions = []
      submissions << submission1
      submissions << FactoryGirl.build(:submission)
    end

    it do
      expect(subject).to include submission1.email
    end
  end
end
