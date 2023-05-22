module Api
  module V1
    class UserStock < ApplicationRecord
      belongs_to :user
      belongs_to :investible, polymorphic: true

      validates :balance, presence: true
    end
  end
end
