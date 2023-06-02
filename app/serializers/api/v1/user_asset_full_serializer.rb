module Api
  module V1
    class UserAssetFullSerializer < UserAssetSerializer
      belongs_to :user
    end
  end
end
