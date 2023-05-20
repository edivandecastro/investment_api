FactoryBot.define do
  factory :stock, class: Api::V1::Stock do
    icon { Faker::Company.logo }
    name { Faker::Commerce.brand }
    description { Faker::Quote.famous_last_words }
    acronym { Faker::Alphanumeric.alpha(number: 4) }
    stock_type { Api::V1::Stock.stock_types[:ordinary] }
    segment
    country
    asset
  end
end
