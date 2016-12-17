FactoryGirl.define do
  factory :submission, aliases: [:to_rate_submission] do
    sequence(:full_name) { |n| "User#{n}" }
    sequence(:email) { |n| "user#{n}@domain.com" }
    age 20
    description "I'm super nice!\nI'm super nice!\nI'm super nice!\n"
    english :basic
    first_time true
    goals "Tons of money!\nTons of money!\nTons of money!\n"
    html :fluent
    css :fluent
    js :used
    programming_others :heard
    rejected false

    trait :with_settings do
      transient do
        accepted_threshold  4
        waitlist_threshold  3
        required_rates_num  3
      end
    end

    factory :accepted_submission do
      rejected false
      after(:create) do |submission, evaluator|
        create_list(:rate, evaluator.required_rates_num, submission: submission, value: evaluator.accepted_threshold)
      end
    end

    factory :waitlist_submission do
      rejected false
      after(:create) do |submission, evaluator|
        create_list(:rate, evaluator.required_rates_num, submission: submission, value: evaluator.waitlist_threshold)
      end
    end

    factory :unaccepted_rejected_submission do
      rejected true
    end

    factory :unaccepted_not_rejected_submission do
      rejected false
      after(:create) do |submission, evaluator|
        create_list(:rate, evaluator.required_rates_num, submission: submission, value: 0)
      end
    end

    trait :rated do
      transient do
        required_rates_num 3
        rate_value 1
      end

      after(:build, :create) do |submission, evaluator|
        create_list(:rate, evaluator.required_rates_num, submission: submission, value: evaluator.rate_value)
      end
    end
  end
end
