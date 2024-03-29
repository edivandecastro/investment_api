module Api
  module V1
    class StockSerializer < ActiveModel::Serializer
      attributes :id, :icon, :ticker_symbol, :stock_type

      belongs_to :asset
      belongs_to :company

      def acronym
        "#{object.acronym}#{object.stock_type}"
      end
    end
  end
end
