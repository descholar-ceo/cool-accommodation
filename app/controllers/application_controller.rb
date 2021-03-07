class ApplicationController < ActionController::API
  before_action :verify_login

  private

  # Verify if a user is logged in
  def verify_login
    token = request.headers['token']
    hmac_secret = 'descholar'
    expected_iss = 'https://cool-accommodation-backend.herokuapp.com/'
    expected_aud = '238d4793-70de-4183-9707-48ed8ecd19d9'

    return render json: { error: 'login first token is missing' }, status: :forbidden unless token

    token.gsub! 'Bearer ', ''
    begin
      JWT.decode token, hmac_secret, true,
                 { verify_iss: true,
                   iss: expected_iss,
                   verify_aud: true,
                   aud: expected_aud,
                   algorithm: 'HS256' }
    rescue JWT::DecodeError
      unless token
        render json: { error: 'login first, something wrong happened with your credentials' },
               status: :forbidden
      end
    end
  end
end
