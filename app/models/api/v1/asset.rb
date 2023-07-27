module Api
  module V1
    class Asset < ApplicationRecord
      self.implicit_order_column = "created_at"

      validates :name, :description, presence: true
    end
  end
end
