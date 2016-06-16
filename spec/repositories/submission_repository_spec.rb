require 'rails_helper'

describe SubmissionRepository do
  before do
    stub_const('SubmissionRepository::ACCEPTED_THRESHOLD', 3)
  end

  describe "#accepted" do
    subject { described_class.new.accepted }

    context "when there are no submissions with rates" do
      before do
        2.times { FactoryGirl.create(:submission) }
      end

      it "doesn't return any submissions" do
        expect(subject).to eq([])
      end
    end

    context "when there are no submissions with rates higher than threshold" do
      before do
        2.times { FactoryGirl.create(:submission, :with_min_rates) }
      end

      it "doesn't return any submissions" do
        expect(subject).to eq([])
      end
    end

    context "when there are two submission with rates higher than threshold" do
      before do
        2.times { FactoryGirl.create(:submission, :with_max_rates) }
      end

      it "returns two submissions" do
        expect(subject.count).to eq(2)
      end
    end
  end
end
