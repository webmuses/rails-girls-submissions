require 'rails_helper'

RSpec.describe SubmissionRejector do
  describe '#reject?' do
    subject {described_class.new(rules).reject?(submission_id)}

    context "when there are no rules" do
      let!(:rules) { [] }
      let!(:submission_id) { FactoryGirl.create(:submission).id }

      it "doesn't reject the submission" do
        expect(subject).to equal(false)
      end
    end
    
    context "when no rules are broken" do
      let!(:rules) { [Rules::EnglishRule.new, Rules::RorRule.new] }
      let!(:submission_id) { FactoryGirl.create(:submission,
         english: "fluent", ror: "heard").id }

      it "doesn't reject the submission" do
        expect(subject).to equal(false)
      end
    end

    context "when some rules are broken" do
      let!(:rules) { [Rules::EnglishRule.new, Rules::AgeRule.new] }
      let!(:submission_id) { FactoryGirl.create(:submission,
         english: "none", age: 20).id }

      it "rejects the submission" do
        expect(subject).to equal(true)
      end
    end
  end
end
