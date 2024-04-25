module Api
  module V1
    module Auth
      class Jwt
        attr_accessor :token, :user

        ALGORITHMS_HMAC_HS256 = 'HS256'
        HMAC_SECRET = Rails.application.credentials.jwt.secret

        def initialize(token: nil, user: nil)
          @token = token
          @user = user
        end

        def generate
          raise Errors::GenerateToken::NotFoundUserError.new if user.nil?

          expiration_time = Time.now.to_i + 4 * 3600
          payload = {
            sub: user.id,
            exp: expiration_time,
            iss: 'INVESTMENT'
          }

          JWT.encode(payload, HMAC_SECRET, ALGORITHMS_HMAC_HS256)
        end

        def validate
          JWT.decode(token, HMAC_SECRET, true, { verify_iss: true, algorithm: 'HS256' })

          { valid: true, token: token }
        rescue JWT::ExpiredSignature
          { valid: false, error: I18n.t('general.expired_token') }
        rescue JWT::InvalidIssuerError
          { valid: false, error: I18n.t('general.invalid_issuer') }
        rescue JWT::DecodeError
          { valid: false, error: I18n.t('general.decode_error') }
        end

        def decode
          JWT.decode(token, HMAC_SECRET, true, { verify_iss: true, algorithm: 'HS256' })
        end
      end
    end
  end
end
