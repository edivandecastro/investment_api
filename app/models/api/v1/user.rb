module Api
  module V1
    class User < ApplicationRecord
      self.implicit_order_column = "created_at"

      validates :name, :email, :password, presence: true
    end
  end
end
