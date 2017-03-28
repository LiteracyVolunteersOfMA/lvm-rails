FactoryGirl.define do
  factory :tutoring_session do
    location { Faker::Address.street_address }
    hours { Faker::Number.between(1, 10) }
    session_comment { Faker::Friends.quote }
  end
end
