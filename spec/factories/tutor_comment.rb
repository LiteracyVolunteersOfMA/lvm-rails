FactoryGirl.define do
  factory :tutor_comment do
    content { Faker::HarryPotter.quote }
  end
end
