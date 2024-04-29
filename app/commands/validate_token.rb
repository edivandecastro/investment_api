class ValidateToken < Actor
  input :token

  def call
    result = Api::V1::Auth::Jwt.new(token: token).validate
    return if result[:valid]
    fail!(error: result[:error])
  end
end
