require 'rails_helper'

RSpec.describe SubmissionRejector do
  describe '#should_reject?' do
    subject {described_class.new(rules).should_reject?(submission)}

    context "when there are no rules" do
      let!(:rules) { [] }
      let!(:submission) { FactoryGirl.create(:submission) }

      it "doesn't reject the submission" do
        expect(subject).to equal(false)
      end
    end

    context "when no rules are broken" do
      let!(:rules) { [Rules::EnglishRule.new, Rules::RorRule.new] }
      let!(:submission) { FactoryGirl.create(:submission,
         english: "fluent", ror: "heard") }

      it "doesn't reject the submission" do
        expect(subject).to equal(false)
      end
    end

    context "when some rules are broken" do
      let!(:rules) { [Rules::EnglishRule.new, Rules::AgeRule.new] }
      let!(:submission) { FactoryGirl.create(:submission,
         english: "none", age: 20) }

      it "rejects the submission" do
        expect(subject).to equal(true)
      end
    end
  end

  describe '#reject' do
    let!(:submission) { FactoryGirl.create(:submission) }

    it "sets rejected attribute to true" do
      described_class.new.reject(submission)
      expect(submission.rejected).to equal(true)
    end
  end
end
