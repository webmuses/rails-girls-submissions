FactoryGirl.define do
  factory :submission do
    full_name "Kuba Kubowski"
    email "kuba.kubowski@domain.com"
    age 20
    codeacademy_username "kuba_kubowski123"
    description "I'm super nice!\nI'm super nice!\nI'm super nice!\nI'm super nice!\nI'm super nice!\nI'm super nice!\nI'm super nice!\nI'm super nice!\nI'm super nice!\nI'm super nice!\nI'm super nice!\nI'm super nice!\n"
    english :basic
    operating_system :windows
    first_time true
    goals "Tons of money!\nTons of money!\nTons of money!\nTons of money!\nTons of money!\nTons of money!\nTons of money!\n"
    problems "I'm shortsighted - can't see money's a shitty goal. :c"
    html :fluent
    css :fluent
    js :used
    ror :heard
    db :never
    programming_others :heard
  end
end
