FactoryGirl.define do
  factory :exam do
    subject { Faker::Name.name }
    exam_date { Faker::Address.street_address }
    score { Faker::Number }
  end
end
