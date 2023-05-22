module Api
  module V1
    class UserStockFullSerializer < UserStockSerializer
      belongs_to :user
    end
  end
end
