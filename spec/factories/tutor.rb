FactoryGirl.define do
  factory :tutor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
  end

  factory :full_tutor, class: Tutor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    after(:create) do |tutor|
      tutor.coordinators << FactoryGirl.create(:coordinator)
    end
  end
end
