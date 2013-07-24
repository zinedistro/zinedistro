FactoryGirl.define do
  factory :zine do
    title Faker::Lorem.words.join(" ").capitalize!
    sequence(:cover_url) {|n| "/covers/zines/#{n}"}
    sequence(:download_url) {|n| "/download/zines/#{n}"}
    authors { FactoryGirl.create_list(:author, 3) }
    factory :unpublished_zine do
      published false
    end
  end
end
