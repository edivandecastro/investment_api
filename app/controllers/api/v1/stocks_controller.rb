class Api::V1::StocksController < Api::V1::ApplicationController
  before_action :set_stock, only: [:show, :update, :destroy]

  def index
    stocks = Api::V1::Stock.page(params[:page]).per(params[:limit])

    render({
      json: stocks,
      root: :stocks,
      each_serializer: Api::V1::StockSerializer,
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
