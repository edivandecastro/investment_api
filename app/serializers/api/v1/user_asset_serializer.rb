module Api
  module V1
    class UserAssetSerializer < ActiveModel::Serializer
      attributes :id, :balance

      belongs_to :investible, key: :stock
    end
  end
end
