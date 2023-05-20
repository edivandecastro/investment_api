module Api
  module V1
    class AssetSerializer < ActiveModel::Serializer
      attributes :id, :name, :description
    end
  end
end
