FactoryGirl.define do
  factory :zine do
    title Faker::Lorem.words.join(' ').capitalize!
    subtitle Faker::Lorem.words.join(' ').capitalize!
    cover_image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/transparent.png')))
    sequence(:download_url) { |n| "/download/zines/#{n}" }
    factory :zine_with_authors do
      ignore do
        authors_count 3
      end
      after :create do |zine, evaluator|
        authors = create_list(:author, evaluator.authors_count)
        zine.authors << authors
      end
    end

    trait :unpublished do
      published false
    end

    trait :published do
      published true
    end

  end
end
