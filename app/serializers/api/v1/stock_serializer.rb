module Api
  module V1
    class StockSerializer < ActiveModel::Serializer
      attributes :id, :icon, :name, :description, :acronym, :stock_type

      belongs_to :country
      belongs_to :segment
      belongs_to :asset

      def acronym
        stock_type = Api::V1::Stock.stock_types[object.stock_type]
        "#{object.acronym}#{stock_type}"
      end
    end
  end
end
