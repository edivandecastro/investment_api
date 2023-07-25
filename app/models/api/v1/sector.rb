module Api
  module V1
    class Sector < ApplicationRecord
      self.implicit_order_column = "created_at"

      validates :name, presence: true
    end
  end
end
