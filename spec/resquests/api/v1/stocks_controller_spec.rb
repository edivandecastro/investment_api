require 'rails_helper'

RSpec.describe 'Api::V1::StocksController', type: :request do
  describe 'GET index' do

    context 'when user_id is passed' do
      let!(:user_stock) { create(:user_asset) }

      it 'return list of stock of user' do
        get api_v1_stocks_path(user_stock.user.id)
        result = JSON.parse(response.body, symbolize_names: true)[:stocks].any?

        expect(response).to be_successful
        expect(result).to eq true
      end
    end

    context 'when user_id is not passed' do
      let!(:stock) { create(:stock) }

      it 'return list of stocks' do
        get api_v1_stocks_path

        stock_result = JSON.parse(response.body, symbolize_names: true)[:stocks]
        stock_result.map! { |stock| stock[:id] }

        expect(response).to be_successful
        expect(stock_result.include?(stock.id)).to be true
      end
    end
  end
end
