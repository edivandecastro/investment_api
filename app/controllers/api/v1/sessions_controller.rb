module Api
  module V1
    class SessionsController < Api::V1::ApplicationController

      def create
        user = User.find_by(email: user_params[:email])
        authenticator = UserAuthentication.call(user:, password:)
        user_serialize = Api::V1::UserSerializer.new(authenticator.user)

        render json: { success: true, user: user_serialize }, status: :ok
      rescue ServiceActor::Failure => error
        render json: { success: false, errors: [error.message] }, status: :unauthorized
      end

      private

      def password
        user_params[:password]
      end

      def user_params
        params.require(:user).permit(
          :email,
          :password
        )
      end
    end
  end
end
