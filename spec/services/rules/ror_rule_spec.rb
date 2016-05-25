require 'rails_helper'

describe Rules::RorRule do
  describe '#broken?' do
    subject { described_class.new.broken?(submission) }

    context "When the applicant is too good a Rails programmer" do
      let!(:submission) { FactoryGirl.create(:submission, ror: "fluent") }
      it { expect(subject).to equal(true) }
    end

    context "When the applicant is not fluent in Rails" do
      let!(:submission) { FactoryGirl.create(:submission, ror: "never") }
      it { expect(subject).to equal(false) }
    end
  end
end
