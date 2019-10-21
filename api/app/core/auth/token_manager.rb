module Auth
  # encode/decodes JWT tokens
  # Defines and manages the format of the token payload.
  class TokenManager
    HMAC_SECRET = 'jfd873$%GFdsiu348fd$%fdk98u;sk(*UFDu)'.freeze

    # Given a token it returns a permission object
    def self.decode(token)
      payload, header = JWT.decode token, HMAC_SECRET, true, { algorithm: 'HS256'  }
      OpenStruct.new(user_id: Integer(payload))
    end

    # Given a permission object it returns a token
    def self.encode(user_id)
      JWT.encode user_id.to_s, HMAC_SECRET, 'HS256'
    end
  end
end
