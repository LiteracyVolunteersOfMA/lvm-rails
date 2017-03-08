FactoryGirl.define do
  factory :affiliate_event do
    title { Faker::HarryPotter.quote }
    date { Faker::Date.between(1.year.ago, 1.day.ago) }
  end
end
