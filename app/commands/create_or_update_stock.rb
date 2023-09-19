class CreateOrUpdateStock < Actor
  input :stocks
  input :user_id

  def call
    stocks.each do |stock_hash|
      stock = Api::V1::Stock.find_by(ticker_symbol: stock_hash[:code])
      user = Api::V1::User.find(user_id)
      user_asset = Api::V1::UserAsset.find_by(user: user, investible: stock)

      (update_user_asset(user_asset, stock_hash) && next) || create_user_asset(user, stock, stock_hash)
    end
  end

  private

  def update_user_asset(user_asset, stock_hash)
    user_asset&.update(amount: stock_hash[:amount], balance: stock_hash[:balance])
  end

  def create_user_asset(user, stock, stock_hash)
    Api::V1::UserAsset.create(user: user,
                              investible: stock,
                              amount: stock_hash[:amount],
                              balance: stock_hash[:balance])
  end
end
