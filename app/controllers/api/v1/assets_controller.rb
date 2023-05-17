class Api::V1::AssetsController < Api::V1::ApplicationController
  def index
    assets = Api::V1::Asset.page(params[:page]).per(params[:limit])

    render({
      json: assets,
      root: :assets,
      each_serializer: Api::V1::AssetSerializer,
      meta: meta_attributes(assets),
      meta_key: 'extra'
    })
  end

  def create
    asset = Api::V1::Asset.new(asset_params)
    asset.save
    render json: asset, root: :asset
  end

  private

  def asset_params
    params.require(:asset).permit(:id, :icon, :codes, :name, :description, :sector, :price, :country_id)
  end
end
