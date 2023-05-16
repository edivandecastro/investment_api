module Api
  module V1
    class CountrySerializer < ActiveModel::Serializer
      attributes :id, :name, :locale, :acronym
    end
  end
end
