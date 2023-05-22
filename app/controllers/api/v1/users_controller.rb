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

  def create
    user = Api::V1::User.new(user_params)

    if user.save
      render json: user, root: :user
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @user, root: :user
  end

  def destroy
    @user.destroy
  end

  def update
    if @user.update(user_params)
      render json: @user, root: :clinic, status: :ok, location: @user
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
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
