FactoryGirl.define do
  factory :coordinator do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
