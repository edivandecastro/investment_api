module Api
  module V1
    class Stock < ApplicationRecord
      belongs_to :segment
      belongs_to :country
      belongs_to :asset

      validates :icon, :name, :description, :acronym, :stock_type, presence: true

      enum stock_type: {
        other: 0,
        subscription_right_ordinary: 1,
        subscription_right_preferred: 2,
        ordinary: 3,
        preferred: 4,
        preferred_class_a: 5,
        preferred_class_b: 6,
        preferred_class_c: 7,
        preferred_class_d: 8,
        subscription_receipt_ordinary: 9,
        subscription_receipt_preferred: 10,
        bdr_etf_unit: 11
      }
     end
  end
end
