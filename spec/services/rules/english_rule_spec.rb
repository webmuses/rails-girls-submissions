require 'rails_helper'

RSpec.describe Rules::EnglishRule do
  describe '#broken?' do
    it 'returns true when english quals none' do
      english_rule = Rules::EnglishRule.new
      submission = FactoryGirl.create(:submission, english: "none")
      expect(english_rule.broken?(submission)).to equal(true)
    end
  end
end
