FactoryGirl.define do
  factory :submission, aliases: [:to_rate_submission] do
    sequence(:full_name) { |n| "User#{n}" }
    sequence(:email) { |n| "user#{n}@domain.com" }
    age 20
    sequence(:codecademy_username) { |n| "user#{n}" }
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

    trait :with_constants do
      transient do
        accepted_threshold SubmissionRepository::ACCEPTED_THRESHOLD
        waitlist_threshold SubmissionRepository::WAITLIST_THRESHOLD
        required_rates_num SubmissionRepository::REQUIRED_RATES_NUM
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

    trait :with_rates do
      transient do
        rates_count SubmissionRepository::REQUIRED_RATES_NUM
      end

      after(:create) do |submission, evaluator|
        create_list(:rate, evaluator.rates_count, submission: submission)
      end
    end
  end
end
