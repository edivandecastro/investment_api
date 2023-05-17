module Api
  module V1
    class Asset < ApplicationRecord
      belongs_to :country

      validates :icon, :codes, :name, :description, :sector, :price, :country, presence: true
    end
  end
end
