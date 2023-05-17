module Api
  module V1
    class AssetSerializer < ActiveModel::Serializer
      attributes :id, :icon, :codes, :name, :description, :sector, :price

      belongs_to :country
    end
  end
end
