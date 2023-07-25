module Api
  module V1
    class Stock < ApplicationRecord
      self.implicit_order_column = "created_at"

      belongs_to :asset
      belongs_to :company

      validates :icon, :acronym, :stock_type, presence: true
     end
  end
end
