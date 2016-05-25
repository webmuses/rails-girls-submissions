require 'rails_helper'

RSpec.describe Rules::AgeRule do
  describe '#broken?' do
    it 'returns true when age is under 18' do
      age_rule = Rules::AgeRule.new
      submission = FactoryGirl.create(:submission, age: 15)
      expect(age_rule.broken?(submission)).to equal(true)
    end
  end
end
