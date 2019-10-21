def token_for(user)
  Auth::TokenManager.encode(user.id)
end
