FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :area do
    name { "Kauai" }
  end

  factory :property do
    name { "Beach house" }
    address { Faker::Address.street_address }
  end

  factory :booking do
    visitor { "Beach house" }
    visit_date { Time.random }
  end
end
