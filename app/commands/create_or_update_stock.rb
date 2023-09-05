class CreateOrUpdateStock < Actor
  input :stocks
  input :user_id

  def call
    stocks.each do |stock_hash|
      stock = Api::V1::Stock.find_by(ticker_symbol: stock_hash[:code])
      user = Api::V1::User.find(user_id)
      user_asset = Api::V1::UserAsset.find_by(user: user, investible: stock)

      if user_asset
        user_asset.update(amount: stock_hash[:amount], balance: stock_hash[:balance])
      else
        Api::V1::UserAsset.create(
          user: user,
          investible: stock,
          amount: stock_hash[:amount],
          balance: stock_hash[:balance]
        )
      end
    end
  end
end
