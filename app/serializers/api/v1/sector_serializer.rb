module Api
  module V1
    class SectorSerializer < ActiveModel::Serializer
      attributes :id, :name
    end
  end
end
