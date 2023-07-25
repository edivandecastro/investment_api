module Api
  module V1
    class Transaction < ApplicationRecord
      self.implicit_order_column = "created_at"

      belongs_to :user
      belongs_to :investible, polymorphic: true

      enum operation_type: { buy: 1, sell: 2 }

      validates :operation_type, :trading_date, :quantity, :unit_value, presence: true
    end
  end
end
