FactoryGirl.define do
  factory :settings, class: Settings do
    accepted_threshold 4
    waitlist_threshold 3
    required_rates_num 2
  end
end
