FactoryBot.define do
  factory :country, class: Api::V1::Country do
    name { Faker::Address.country }
    locale { Faker::Address.country_code }
    acronym { Faker::Address.country_code_long }
  end
end
