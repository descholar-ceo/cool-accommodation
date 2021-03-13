class LoginController < ApplicationController
  # POST /login
  def create
    user = User.find_by(email: params[:email])
    if user.present? and user.authenticate params[:password]
      exp = Time.now.to_i + 86_400
      payload = { "iss": 'https://cool-accommodation-backend.herokuapp.com/',
                  "exp": exp,
                  "aud": '238d4793-70de-4183-9707-48ed8ecd19d9',
                  "sub": '19016b73-3ffa-4b26-80d8-aa9287738677',
                  "email": user.email,
                  "id": user.id }
      hmac_secret = 'descholar'
      @token = JWT.encode payload, hmac_secret, 'HS256'

      render json: @token, status: :created, location: @token
    else
      render json: { error: 'Wrong credentials' }, status: :unprocessable_entity
    end
  end
end
