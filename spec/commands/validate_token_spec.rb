require 'rails_helper'

RSpec.describe ValidateToken, type: :model do
  describe ".call" do
    context "when token is invalid" do
      it "raise ServiceActor::Failure exception" do
        error_message = I18n.t('general.decode_error')

        expect {
          ValidateToken.call(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9")
        }.to raise_error(ServiceActor::Failure, error_message)
      end
    end

    context "when token is valid" do
      let(:user) { create(:user) }
      let(:token) { Api::V1::Auth::Jwt.new(user:).generate }

      it "return an success" do
        result = ValidateToken.call(token: token)
        expect(result.success?).to be true
      end
    end
  end
end
