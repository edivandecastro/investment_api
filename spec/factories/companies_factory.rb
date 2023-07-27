FactoryBot.define do
  factory :company, class: Api::V1::Company do
    icon { Faker::Company.logo }
    name { Faker::Commerce.brand }
    code { Faker::Alphanumeric.alpha(number: 4) }
    code_cvm { Faker::Number.between(from: 1000, to: 9999) }
    description { Faker::Quote.famous_last_words }
    cnpj { Faker::Company.brazilian_company_number }
    website { Faker::Internet.url }
    country
    sector
  end
end
