module Errors
  module GenerateToken
    class NotFoundUserError < StandardError
      def message
        I18n.t('comand.errors.generate_token.not_found_user_error')
      end
    end
  end
end
