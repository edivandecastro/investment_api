require 'rails_helper'

RSpec.describe ValidateAuthorizationType, type: :model do
  describe ".call" do
    context "when authorization type is invalid" do
      it "raise ServiceActor::Failure exception" do
        error_message = I18n.t("comand.errors.invalid_token")

        expect {
          ValidateAuthorizationType.call(authorization: "")
        }.to raise_error(ServiceActor::Failure, error_message)
      end
    end

    context "when authorization type is valid" do
      let(:token) { "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9" }
      it "return success" do
        error_message = I18n.t("comand.errors.invalid_token")
        result = ValidateAuthorizationType.call(authorization: "Bearer #{token}")
        expect(result.success?).to be true
      end
    end
  end
end
