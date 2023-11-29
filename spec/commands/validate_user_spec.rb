require 'rails_helper'

RSpec.describe ValidateUser, type: :model do
  describe ".call" do
    context "when username is invalid" do
      it "raise ServiceActor::Failure exception" do
        error_message = I18n.t("devise.failure.invalid", authentication_keys: "email")

        expect {
          ValidateUser.call(user: nil, password: "123")
        }.to raise_error(ServiceActor::Failure, error_message)
      end
    end

    context "when password is invalid" do
      let(:user) { create(:user) }

      it "raise ServiceActor::Failure exception" do
        error_message = I18n.t("devise.failure.invalid", authentication_keys: "email")

        expect {
          ValidateUser.call(user:, password: "123")
        }.to raise_error(ServiceActor::Failure, error_message)
      end
    end

    context "when username and password is valid" do
      let(:user) { create(:user) }

      it "return context success" do
        expect(ValidateUser.call(user:, password: user.password).success?).to be true
      end
    end
  end
end
