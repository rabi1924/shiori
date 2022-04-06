FactoryBot.define do
  factory :memo do
    title  { Faker::Lorem.sentence }
    goal   { Faker::Lorem.sentence }
    action { Faker::Lorem.sentence }
    note   { Faker::Lorem.sentence }

    association :user
  end
end
