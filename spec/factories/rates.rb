FactoryGirl.define do
  factory :rate do
    association :submission
    value 1
  end
end
