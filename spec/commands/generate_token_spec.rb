require 'rails_helper'

RSpec.describe GenerateToken, type: :model do
  describe '.call' do
    context 'when a user is passed' do
      let(:user) { create(:user) }

      it 'return token jwt' do
        expect(GenerateToken.call(user:).user.jti.size).to eq 176
      end
    end

    context 'when a user not is passed' do
      let(:user) { nil }

      it 'exception Errors::GenerateToken::NotFoundUserError' do
        msg = I18n.t('comand.errors.generate_token.not_found_user_error')
        expect{ GenerateToken.call(user:) }.to raise_error(Errors::GenerateToken::NotFoundUserError, msg)
      end
    end
  end
end
