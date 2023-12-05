require 'rails_helper'

RSpec.describe Api::V1::Auth::Jwt, type: :model do
  subject { Api::V1::Auth::Jwt.new(user:) }

  let(:user) { create(:user) }

  describe '#generate' do
    context 'when a user is passed' do
      it 'return token jwt' do
        expect(subject.generate.blank?).to be false
      end
    end

    context 'when a user not is passed' do
      let(:user) { nil }

      it 'exception Errors::GenerateToken::NotFoundUserError' do
        msg = I18n.t('comand.errors.generate_token.not_found_user_error')
        expect{ subject.generate }.to raise_error(Errors::GenerateToken::NotFoundUserError, msg)
      end
    end
  end
end
