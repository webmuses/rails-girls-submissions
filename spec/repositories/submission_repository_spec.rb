require 'rails_helper'

describe SubmissionRepository do
  before do
    stub_const('SubmissionRepository::ACCEPTED_THRESHOLD', 3)
  end
  before do
    stub_const('SubmissionRepository::WAITLIST_THRESHOLD', 2)
  end
  before do
    stub_const('SubmissionRepository::REQUIRED_RATES_NUM', 3)
  end

  describe "#accepted" do
    subject { described_class.new.accepted }

    context "when there are no submissions with rates higher than accepted threshold" do
      before do
        2.times { FactoryGirl.create(:submission, :with_rate_average_2) }
      end

      it "doesn't return any submissions" do
        expect(subject).to eq([])
      end
    end

    context "when there are 2 submission with rates higher than accepted threshold" do
      before do
        2.times { FactoryGirl.create(:submission, :with_rate_average_5) }
      end

      it "returns two submissions" do
        expect(subject.count).to eq(2)
      end
    end
  end

  describe "#waitlist" do
    subject { described_class.new.waitlist }

    context "when there are no submissions with rates higher than waitlist threshold" do
      before do
        2.times { FactoryGirl.create(:submission, :with_rate_average_1) }
      end

      it "doesn't return any submissions" do
        expect(subject).to eq([])
      end
    end

    context "when there are 2 submission with rates higher than waitlist threshold but lower than approved threshold" do
      before do
        2.times { FactoryGirl.create(:submission, :with_rate_average_2) }
      end

      it "returns two submissions" do
        expect(subject.count).to eq(2)
      end
    end

    context "when there are 2 submission with rates higher than approved threshold" do
      before do
        2.times { FactoryGirl.create(:submission, :with_rate_average_5) }
      end

      it "doesn't return any submissions" do
        expect(subject.count).to eq(0)
      end
    end
  end

  describe "#unaccepted" do
    subject { described_class.new.unaccepted }

    context "when there are 2 submissions with rates lower than waitlist threshold" do
      before do
        2.times { FactoryGirl.create(:submission, :with_rate_average_1) }
      end

      it "returns two submissions" do
        expect(subject.count).to eq(2)
      end
    end

    context "when there are 2 submission with rates higher than waitlist threshold" do
      before do
        2.times { FactoryGirl.create(:submission, :with_rate_average_2) }
      end

      it "doesn't return any submissions" do
        expect(subject.count).to eq(0)
      end
    end
  end

  describe "#rejected" do
    subject { described_class.new.rejected }

    context "when there are 3 submissions: 1. with no rates, 2. with rates 3. with rejected equal true" do
      let!(:rejected_submission) { FactoryGirl.create(:submission, rejected: true) }
      let!(:to_rate_submission) { FactoryGirl.create(:submission) }
      let!(:rated_submission) { FactoryGirl.create(:submission, :with_rates) }

      it "returns submission 3 with rejected equal true" do
        expect(subject).to eq [rejected_submission]
      end
    end
  end
end
