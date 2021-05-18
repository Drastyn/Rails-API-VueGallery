class AuthenticateUser
    prepend SimpleCommand

    def initialize(unsername, password)
        @username = username
        @password = password
    end

    def call
        JsonWebToken::encode(user_id: user.id) if user
    end

    private

    attr_accessor :username, :password

    def user
        user = User.find_by_name(username)
        return user if user && user.authenticate(password)

        errors.add :user_authentication, 'Invalid credentials'
    end
end