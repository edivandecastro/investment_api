require 'rails_helper'

RSpec.describe 'Api::V1::RegistrationsController', type: :request do
  describe 'POST create user' do
    context 'with valid parameters' do
      it 'renders a successful response' do
        post api_v1_user_registration_path({
          user: {
            name: 'The Butcher',
            email: 'sam_marks@marvin-borer.test',
            password: '123456'
          }
        })

        expect(response).to have_http_status(:success)
      end

      it 'creates a new User' do
        expect { post api_v1_user_registration_path({
          user: {
            name: 'The Butcher',
            email: 'sam_marks@marvin-borer.test',
            password: '123456'
          }
        }) }.to change{ Api::V1::User.count }.by(1)
      end
    end

    context 'with invalid parameters' do
      it 'renders a error response' do
        post api_v1_user_registration_path({
          user: {
            email: 'sam_marks@marvin-borer.test',
            password: '123456'
          }
        })

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
