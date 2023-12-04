class GenerateToken < Actor
  input :user

 def call
    user.jti = Api::V1::Auth::Jwt.new(user:).generate
  end
end
