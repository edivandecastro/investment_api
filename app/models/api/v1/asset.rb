module Api
  module V1
    class Asset < ApplicationRecord
      validates :name, :description, presence: true
    end
  end
end
