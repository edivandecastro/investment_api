FactoryBot.define do
  factory :asset, class: Api::V1::Asset do
    name { Faker::Commerce.brand }
    description { Faker::Quote.famous_last_words }
  end
end
