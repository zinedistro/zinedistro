FactoryGirl.define do
  factory :zine do
    title Faker::Lorem.words.join(' ').capitalize!
    subtitle Faker::Lorem.words.join(' ').capitalize!
    sequence(:cover_url) { |n| "/covers/zines/#{n}" }
    sequence(:download_url) { |n| "/download/zines/#{n}" }

    trait :with_3_authors do
      authors { create_list :author, 3 }
    end

    trait :with_no_authors do
      authors []
    end

    factory :unpublished_zine do
      published false
    end
  end
end
