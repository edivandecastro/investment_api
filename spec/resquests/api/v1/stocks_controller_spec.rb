require 'rails_helper'

RSpec.describe 'Api::V1::StocksController', type: :request do
  describe 'GET index' do

    context 'when user_id is passed' do
      let!(:user_stock) { create(:user_asset) }

      it 'return list of stock of user' do
        get api_v1_user_stocks_path(user_stock.user.id)
        user_stock_result = JSON.parse(response.body, symbolize_names: true)[:user_stocks].first

        expect(response).to be_successful
        expect(user_stock.id).to eq user_stock_result[:id]
      end
    end

    context 'when user_id is not passed' do
      let!(:stock) { create(:stock) }

      it 'return list of stocks' do
        get api_v1_stocks_path

        stock_result = JSON.parse(response.body, symbolize_names: true)[:stocks].first

        expect(response).to be_successful
        expect(stock.id).to eq stock_result[:id]
      end
    end
  end
end
