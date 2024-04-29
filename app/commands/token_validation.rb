class TokenValidation < Actor
  play ValidateAuthorizationType, ValidateToken
end
