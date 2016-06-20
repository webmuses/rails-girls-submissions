require 'rails_helper'

describe SubmissionRepository do
  before do
    stub_const('SubmissionRepository::ACCEPTED_THRESHOLD', 3)
    stub_const('SubmissionRepository::WAITLIST_THRESHOLD', 2)
    stub_const('SubmissionRepository::REQUIRED_RATES_NUM', 3)
  end

  let!(:constants) do
    { accepted_threshold: SubmissionRepository::ACCEPTED_THRESHOLD,
      waitlist_threshold: SubmissionRepository::WAITLIST_THRESHOLD,
      required_rates_num: SubmissionRepository::REQUIRED_RATES_NUM }
  end

  let!(:accepted_submission) { FactoryGirl.create(:accepted_submission, :with_constants, constants) }
  let!(:waitlist_submission) { FactoryGirl.create(:waitlist_submission, :with_constants, constants) }
  let!(:unaccepted_not_rejected_submission) { FactoryGirl.create(:unaccepted_not_rejected_submission, :with_constants, constants) }
  let!(:unaccepted_rejected_submission)  { FactoryGirl.create(:unaccepted_rejected_submission, :with_constants, constants) }
  let!(:to_rate_submission) { FactoryGirl.create(:to_rate_submission) }

  describe "#accepted" do
    subject { described_class.new.accepted }

    it "returns submissions that are not rejected or are rated and the average rate is equal to or above accepted_threshold" do
      expect(subject).to eq [accepted_submission]
    end
  end

  describe "#waitlist" do
    subject { described_class.new.waitlist }

    it "returns submissions that are not rejected or are rated and the average rate is equal to or above waitlist_threshold and their average is below accepted_threshold" do
      expect(subject).to eq [waitlist_submission]
    end
  end

  describe "#unaccepted" do
    subject { described_class.new.unaccepted }

    it "returns submissions that are either rejected or are rated and the average rate is below waitlist_threshold" do
      lists_diff = subject - [unaccepted_rejected_submission, unaccepted_not_rejected_submission]
      expect(lists_diff).to eq []
    end
  end

  describe "#rejected" do
    subject { described_class.new.rejected }

    it "returns submissions that are rejected" do
      expect(subject).to eq [unaccepted_rejected_submission]
    end
  end

  describe "#rated" do
    subject { described_class.new.rated }

    it "returns submissions that are rated" do
      lists_diff = subject - [accepted_submission, waitlist_submission, unaccepted_not_rejected_submission]
      expect(lists_diff).to eq []
    end
  end

  describe "#to_rate" do
    subject { described_class.new.to_rate }

    it "returns submissions that are not rejected, but are not rated yet" do
      expect(subject).to eq [to_rate_submission]
    end
  end
end
