FactoryGirl.define do
  factory :author do
    sequence(:name) { |n| "Author #{n}" }
  end
  trait :with_zines do
    after(:create) do |instance|
      create_list :zine, 3, authors: [instance]
    end
  end
end
