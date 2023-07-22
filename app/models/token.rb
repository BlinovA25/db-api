class Token < ApplicationRecord

    # returns true if token is valid
    # later can be changed to 0 if not valid, 1 if expired, 2 if valid
    def check
        token = Token.find_by(token: self.token)
        !token.nil? && token.expires_at > DateTime.now
    end

    class << self
        def generate_token
            token_value = SecureRandom.hex(10)

            new_token = Token.create!(token: token_value, expires_at: DateTime.now + 1.day)
            new_token.token
        end

        # generate user specific token with bigger livetime
        def generate_personal_token
            # SecureRandom.hex(5) + Username
        end
    end
end
