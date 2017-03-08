FactoryGirl.define do
  factory :exam do
    subject { Faker::Internet.slug('English') }
    exam_date { Faker::Date }
    score { Faker::Number.number(3) }
  end
end
