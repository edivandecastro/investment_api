class Api::V1::AssetsController < Api::V1::ApplicationController
  before_action :set_asset, only: [:show, :update, :destroy]

  def index
    assets = Api::V1::Asset.page(params[:page]).per(params[:limit])

    render({
      json: assets,
      root: :assets,
      each_serializer: Api::V1::AssetSerializer,
      meta: meta_attributes(assets),
      meta_key: "extra"
    })
  end

  def create
    asset = Api::V1::Asset.new(asset_params)
    if asset.save
      render json: asset, root: :asset
    else
      render json: { errors: asset.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @asset, root: :asset
  end

  def destroy
    @asset.destroy
  end

  def update
    if @asset.update(asset_params)
      render json: @asset, root: :asset, status: :ok, location: @asset
    else
      render json: { errors: @asset.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_asset
    @asset = Api::V1::Asset.find(params[:id])
  end

  def asset_params
    params.require(:asset).permit(:id, :icon, :codes, :name, :description, :sector, :price, :country_id)
  end
end
