FactoryBot.define do
  factory :user_stock, class: Api::V1::UserStock do
    user
    association :investible, factory: :stock
    balance { Faker::Commerce.price }
  end
end
