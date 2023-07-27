module Api
  module V1
    class Company < ApplicationRecord
      self.implicit_order_column = "created_at"

      belongs_to :sector
      belongs_to :country
    end
  end
end
