class Api::V1::StocksController < Api::V1::ApplicationController
  before_action :set_stock, only: [:show, :update, :destroy]

  def index
    stocks = user_assets_search.page(params[:page]).per(params[:limit])

    render({
      json: stocks,
      root: root_key,
      each_serializer: serialize_class,
      meta: meta_attributes(stocks),
      meta_key: "metadata"
    })
  end

  def create
    stock = Api::V1::Stock.new(stock_params)

    if stock.save
      render json: stock, root: :stock
    else
      render json: { errors: stock.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @stock, root: :stock
  end

  def destroy
    @stock.destroy
  end

  def update
    if @stock.update(stock_params)
      render json: @stock, root: :clinic, status: :ok, location: @stock
    else
      render json: { errors: @stock.errors }, status: :unprocessable_entity
    end
  end

  private

  def serialize_class
    return Api::V1::StockSerializer if params[:user_id].nil?
    Api::V1::UserAssetSerializer
  end

  def root_key
    return :stocks if params[:user_id].nil?
    :user_stocks
  end

  def user_assets_search
    return Api::V1::Stock if params[:user_id].nil?

    Api::V1::UserAsset.where(user_id: params[:user_id])
  end

  def set_stock
    @stock = Api::V1::Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(
      :id,
      :icon,
      :name,
      :description,
      :acronym,
      :stock_type,
      :segment_id,
      :country_id,
      :asset_id
    )
  end
end
