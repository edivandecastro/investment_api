FactoryBot.define do
  factory :user_asset, class: Api::V1::UserAsset do
    user
    association :investible, factory: :stock
    balance { Faker::Commerce.price }
  end
end
