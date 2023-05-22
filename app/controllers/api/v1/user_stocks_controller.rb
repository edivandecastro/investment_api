class Api::V1::UserStocksController < Api::V1::ApplicationController
  before_action :set_user_stock, only: [:show, :update, :destroy]

  def index
    user_stocks = user_stocks_search.page(params[:page]).per(params[:limit])

    render({
      json: user_stocks,
      root: :user_stocks,
      each_serializer: user_stocks_serializer,
      meta: meta_attributes(user_stocks),
      meta_key: "metadata"
    })
  end

  def create
    user_stock = Api::V1::UserStock.new(user_stock_params)

    if user_stock.save
      render json: user_stock, root: :user_stock
    else
      render json: { errors: user_stock.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @user_stock, root: :user_stock
  end

  def destroy
    @user_stock.destroy
  end

  def update
    if @user_stock.update(user_stock_params)
      render json: @user_stock, root: :clinic, status: :ok, location: @user_stock
    else
      render json: { errors: @user_stock.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_stocks_search
    return Api::V1::UserStock if params[:user_id].nil?

    Api::V1::UserStock.where(user_id: params[:user_id])
  end

  def user_stocks_serializer
    return Api::V1::UserStockFullSerializer if params[:user_id].nil?

    Api::V1::UserStockSerializer
  end

  def set_user_stock
    @user_stock = Api::V1::UserStock.find(params[:id])
  end

  def user_stock_params
    params.require(:user_stock).permit(
      :id,
      :balance,
      :user_id
    )
  end
end
