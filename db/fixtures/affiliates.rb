require 'application_helper'

10.times do
  Affiliate.seed do |t|
    t.name = Faker::Address.city
    t.address = Faker::Address.street_address
    t.phone_number = Faker::Base.numerify('(###) ###-####')
    t.email = Faker::Internet.email
    t.website = Faker::Internet.url('example.com')
    t.twitter = Faker::Internet.user_name
  end
end
