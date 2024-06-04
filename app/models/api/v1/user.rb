module Api
  module V1
    class User < ApplicationRecord
      self.implicit_order_column = "created_at"

      attr_accessor :jti

      devise :database_authenticatable,
             :registerable,
             :recoverable,
             :rememberable,
             :validatable,
             #:confirmable,
             :lockable,
             :trackable

      validates :name, presence: true
    end
  end
end
