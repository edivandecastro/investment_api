module Api
  module V1
    class RegistrationsController < Api::V1::ApplicationController
      def create
        user = Api::V1::User.new(user_params)

        if user.save
          render json: user, root: :user
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(
          :id,
          :name,
          :email,
          :password
        )
      end
    end
  end
end
