class Api::V1::UserAssetsController < Api::V1::ApplicationController
  before_action :set_user_asset, only: [:show, :update, :destroy]

  def index
    user_assets = user_assets_search.page(params[:page]).per(params[:limit])

    render({
      json: user_assets,
      root: :user_stocks,
      each_serializer: user_assets_serializer,
      meta: meta_attributes(user_assets),
      meta_key: "metadata"
    })
  end

  def create
    user_asset = Api::V1::UserAsset.new(user_asset_params)

    if user_asset.save
      render json: user_asset, root: :user_stock
    else
      render json: { errors: user_asset.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @user_asset, root: :user_stock
  end

  def destroy
    @user_asset.destroy
  end

  def update
    if @user_asset.update(user_asset_params)
      render json: @user_asset, root: :user_stock, status: :ok, location: @user_asset
    else
      render json: { errors: @user_asset.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_assets_search
    return Api::V1::UserAsset if params[:user_id].nil?

    Api::V1::UserAsset.where(user_id: params[:user_id])
  end

  def user_assets_serializer
    return Api::V1::UserStockFullSerializer if params[:user_id].nil?

    Api::V1::UserAssetSerializer
  end

  def set_user_asset
    @user_asset = Api::V1::UserAsset.find(params[:id])
  end

  def user_asset_params
    params.require(:user_asset).permit(
      :id,
      :balance,
      :user_id
    )
  end
end
