module Api
  module V1
    class User < ApplicationRecord
      validates :name, :email, :password, presence: true
    end
  end
end
