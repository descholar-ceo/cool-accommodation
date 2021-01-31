class LoginController < ApplicationController
  # POST /login
  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      render json: {error: 'Wrong credentials'}, status: :unprocessable_entity
    else
      exp = Time.now.to_i + 86_400
      payload = { "iss": 'https://cool-accommodation-backend.herokuapp.com/',
                  "exp": exp,
                  "aud": '238d4793-70de-4183-9707-48ed8ecd19d9',
                  "sub": '19016b73-3ffa-4b26-80d8-aa9287738677',
                  "username": user.username,
                  "email": user.email,
                  "id": user.id,
                  "roles": {admin: user.admin_role, user: user.user_role} }
      @token = JWT.encode payload, Rails.configuration.x.oauth.jwt_secret, 'HS256'

      render json: @token, status: :created, location: @token
    end
  end

  # DELETE /destroy
  # def destroy
  #   @user.destroy
  # end
end
