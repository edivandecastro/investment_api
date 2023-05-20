module Api
  module V1
    class SegmentSerializer < ActiveModel::Serializer
      attributes :id, :name
    end
  end
end
