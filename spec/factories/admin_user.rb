FactoryBot.define do
  factory :admin_user do
    sequence(:email) { |n| "robot_#{n}@zinedistro.org" }
    password { Faker::Lorem.words.join(' ').capitalize! }
  end
end
