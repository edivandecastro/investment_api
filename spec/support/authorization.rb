module Support
  module Authorization
    def get_with_token(path, user=nil)
      get path, params: nil, headers: { 'Authorization': "Bearer #{token_for(user)}" }
    end

    private

    def token_for(user)
      user = user || create(:user)
      Api::V1::Auth::Jwt.new(user:).generate
    end
  end
end
