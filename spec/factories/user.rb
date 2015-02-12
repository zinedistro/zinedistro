FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@zinedistro.org" }
    password 'password'
  end
end
