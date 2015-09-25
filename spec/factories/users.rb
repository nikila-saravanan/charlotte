FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Name.email }
    f.password { Faker::Name.password }
  end
end
