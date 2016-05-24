FactoryGirl.define do
  factory :submission do
    sequence(:full_name) { |n| "User#{n}" }
    sequence(:email) { |n| "user#{n}@domain.com" }
    age 20
    sequence(:codeacademy_username) { |n| "user#{n}" }
    description "I'm super nice!\nI'm super nice!\nI'm super nice!\n"
    english :basic
    operating_system :windows
    first_time true
    goals "Tons of money!\nTons of money!\nTons of money!\n"
    problems "I'm shortsighted - can't see money's a shitty goal. :c"
    html :fluent
    css :fluent
    js :used
    ror :heard
    db :never
    programming_others :heard
    rejected false

    trait :with_rates do
      transient do
        rates_count Submission::REQUIRED_RATES_NUM
      end

      after(:create) do |submission, evaluator|
        create_list(:rate, evaluator.rates_count, submission: submission)
      end
    end
  end
end
