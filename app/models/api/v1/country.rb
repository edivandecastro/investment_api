module Api
  module V1
    class Country < ApplicationRecord
      self.implicit_order_column = "created_at"
    end
  end
end
