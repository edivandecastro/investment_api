module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :name, :email, :created_at, :updated_at

    end
  end
end
