module Api
  module V1
    module Auth
      class Jwt
        attr_accessor :token, :user

        ALGORITHMS_HMAC_HS256 = 'HS256'

        def initialize(token: nil, user: nil)
          @token = token
          @user = user
        end

        def generate
          raise Errors::GenerateToken::NotFoundUserError.new if user.nil?

          hmac_secret = Rails.application.credentials.jwt_secret

          expiration_time = Time.now.to_i + 4 * 3600
          payload = {
            sub: user.id,
            exp: expiration_time,
            iss: 'INVESTIMENT'
          }

          JWT.encode(payload, hmac_secret, ALGORITHMS_HMAC_HS256)
        end

        def validate
          hmac_secret = ENV.fetch('JWT_SECRET')

          begin
            JWT.decode(token, hmac_secret, true, { verify_iss: true, algorithm: 'HS256' })

            { valid: true, token: token }
          rescue JWT::ExpiredSignature
            { valid: false, error: I18n.t('general.expired_token') }
          rescue JWT::InvalidIssuerError
            { valid: false, error: I18n.t('general.invalid_issuer') }
          rescue JWT::DecodeError
            { valid: false, error: I18n.t('general.decode_error') }
          end
        end
      end
    end
  end
end
