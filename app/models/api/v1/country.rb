module Api
  module V1
    class Country < ApplicationRecord
      self.implicit_order_column = "created_at"

      validates :name, :locale, :acronym, presence: true
    end
  end
end
