class Api::V1::UsersController < Api::V1::ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = Api::V1::User.page(params[:page]).per(params[:limit])

    render({
      json: users,
      root: :users,
      each_serializer: Api::V1::UserSerializer,
      meta: meta_attributes(users),
      meta_key: "metadata"
    })
  end

  def show
    render json: @user, root: :user
  end

  def destroy
    @user.destroy
  end

  def update
    if @user.update(user_params)
      render json: @user, root: :user, status: :ok, location: @user
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def position_import
    begin
      context = ImportPositionInStock.call(document: params[:document], user_id: user_id_in_token)
      render json: { success: context.success? }, status: :ok
    rescue ServiceActor::Failure => e
      render json: { errors: e.message }, status: :unprocessable_entity
    end
  end

  def patrimony
    begin
      context = PatrimonyCalculation.call(user_id: user_id_in_token)
      render json: { total: context.balance }, status: :ok
    rescue ServiceActor::Failure => e
      render json: { errors: e.message }, status: :unprocessable_entity
    end
  end

  def stocks
    stocks = Api::V1::UserAsset.where(user_id: user_id_in_token).page(params[:page]).per(params[:limit])

    render({
      json: stocks,
      root: :user_stocks,
      each_serializer: Api::V1::UserAssetSerializer,
      meta: meta_attributes(stocks),
      meta_key: "metadata"
    })
  end

  private

  def set_user
    @user = Api::V1::User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :id,
      :name,
      :email,
      :password
    )
  end
end
