module Api
  module V1
    class Segment < ApplicationRecord
      validates :name, presence: true
    end
  end
end
