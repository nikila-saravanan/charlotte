FactoryGirl.define do
  factory :artist do |f|
    f.name { Faker::Name.name }
    f.url { Faker::Internet.url }
    f.followers { Faker::Number.number }
    f.user { Faker::Number.number }
  end
end
