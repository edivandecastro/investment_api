require 'rails_helper'

RSpec.describe CreateOrUpdateStock, type: :model do
  let(:document) do
    Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'position.xlsx'))
  end
  let!(:stock) { create(:stock, ticker_symbol: "ABEV3") }
  let(:user) { create(:user) }

  describe ".call" do
    context "when there is already an import of stock from the stock" do
      it "should import the stock" do
        expect(Api::V1::UserAsset.any?).to be false
        CreateOrUpdateStock.call(stocks: stocks, user_id: user.id)
        expect(Api::V1::UserAsset.any?).to be true
      end
    end

    context "when there is no import of stock from the stock" do
      let!(:user_asset) { create(:user_asset, user: user, investible: stock, amount: 10) }

      it "should update the stock" do
        CreateOrUpdateStock.call(stocks: stocks, user_id: user.id)
        user_asset.reload
        expect(user_asset.amount).to eq 100
      end
    end
  end

  def stocks
    [
      {:amount=>100, :balance=>90.0, :code=>"ABEV3"}
    ]
  end
end
