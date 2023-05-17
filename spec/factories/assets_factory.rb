FactoryBot.define do
  factory :asset, class: Api::V1::Asset do
    icon { Faker::Company.logo }
    codes { Faker::Alphanumeric.alpha(number: 4) }
    name { Faker::Commerce.brand }
    description { Faker::Quote.famous_last_words }
    sector { Faker::Company.department }
    price { Faker::Commerce.price }
    country
  end
end
