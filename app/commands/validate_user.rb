class ValidateUser < Actor
  input :user
  input :password, allow_nil: false

  def call
    return if user && user.valid_password?(password)
    fail!(error: I18n.t("devise.failure.invalid", authentication_keys: "email"))
  end
end
