require 'rails_helper'

RSpec.describe CalculateStockBalance, type: :model do

  describe ".call" do
    let(:user) { create(:user) }
    let!(:user_asset) { create_list(:user_asset, 3, user: user) }

    it "should return balance total of stock for user" do
      expect(CalculateStockBalance.call(user_id: user.id).balance > 0).to be true
    end
  end
end
