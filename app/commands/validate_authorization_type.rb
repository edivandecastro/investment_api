class ValidateAuthorizationType < Actor
  input :authorization
  output :token

  def call
    authorization_type, self.token = authorization&.split(' ')

    return if self.token && authorization_type.include?('Bearer')
    fail!(error: I18n.t("comand.errors.invalid_token"))
  end
end
