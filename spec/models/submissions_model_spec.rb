require "rails_helper"

RSpec.describe Submission, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:submission)).to be_valid
  end

  it "requires a full_name" do
    expect(FactoryGirl.build(:submission, full_name: "")).not_to be_valid
  end

  it "requires a valid email" do
    expect(FactoryGirl.build(:submission, email: "invalid#email.io")).not_to be_valid
    expect(FactoryGirl.build(:submission, email: "invalid@emaiio")).not_to be_valid
  end

  it "requires age between 0 and 110" do
    expect(FactoryGirl.build(:submission, age: -30)).not_to be_valid
    expect(FactoryGirl.build(:submission, age: 130)).not_to be_valid
  end

  context "scopes" do
    before(:all) do
      @rejected_submission = FactoryGirl.create(:submission, rejected: true)
      @to_rate_submission = FactoryGirl.create(:submission)
      @rated_submission = FactoryGirl.create(:submission, :with_rates)
    end

    it "should only return rejected submissions" do
      expect(Submission.rejected).to eq [@rejected_submission]
    end

    it "should only return submissions to rate" do
      expect(Submission.to_rate).to eq [@to_rate_submission]
    end

    it "should only return rated submissions" do
      expect(Submission.rated).to eq [@rated_submission]
    end

  end
end
