module Api
  module V1
    class UserAsset < ApplicationRecord
      self.implicit_order_column = "created_at"

      belongs_to :user
      belongs_to :investible, polymorphic: true

      validates :balance, presence: true
    end
  end
end
