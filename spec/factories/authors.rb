FactoryGirl.define do
  factory :author do
    sequence(:name) { |n| "Author #{n}" }
    factory :author_with_zines do
      transient do
        zines_count 3
      end
      after(:create) do |author, evaluator|
        zines = create_list(:zine, evaluator.zines_count)
        zines.each do |zine|
          zine.authors << author
        end
      end
    end
  end
end
