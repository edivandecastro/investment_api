FactoryBot.define do
  factory :stock, class: Api::V1::Stock do
    icon { Faker::Company.logo }
    ticker_symbol { Faker::Alphanumeric.alpha(number: 4) }
    stock_type { 3 }
    isin { Faker::Alphanumeric.alpha(number: 10) }
    company
    asset
  end
end
