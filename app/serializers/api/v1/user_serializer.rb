module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :name, :email, :token, :created_at, :updated_at

      def token
        self.object.jti
      end
    end
  end
end
