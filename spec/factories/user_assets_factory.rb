FactoryBot.define do
  factory :user_asset, class: Api::V1::UserAsset do
    user
    amount { Faker::Number.number(digits: 2) }
    association :investible, factory: :stock
    balance { Faker::Commerce.price }
  end
end
