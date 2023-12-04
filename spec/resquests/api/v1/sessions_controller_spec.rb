require 'rails_helper'

RSpec.describe 'Api::V1::SessionsController', type: :request do
  context 'with valid parameters' do
    let(:user) { create(:user) }

    it 'renders a successful response' do
      post api_v1_user_session_path({
        user: {
          email: user.email,
          password: user.password
        }
      })

      expect(response).to have_http_status(:success)
    end
  end

  context 'with invalid parameters' do
    it 'renders a error response' do
      post api_v1_user_session_path({
        user: {
          email: 'sam_marks@marvin-borer.test',
          password: '123456'
        }
      })

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
