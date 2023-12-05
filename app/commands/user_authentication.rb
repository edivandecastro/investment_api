class UserAuthentication < Actor
  play ValidateUser, GenerateToken
end
