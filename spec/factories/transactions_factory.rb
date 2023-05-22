FactoryBot.define do
  factory :transaction, class: Api::V1::Transaction do
    operation_type { Api::V1::Transaction.operation_types[:buy] }
    trading_date { Date.today }
    quantity { 1 }
    unit_value { Faker::Commerce.price }
    user
    association :investible, factory: :stock
  end
end
