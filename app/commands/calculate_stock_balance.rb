class CalculateStockBalance < Actor
  input :user_id
  output :balance

  def call
    user_assets = Api::V1::UserAsset.where(user_id:)
    self.balance ||= 0
    user_assets.each do |user_asset|
      self.balance += user_asset.balance
    end
  end
end
