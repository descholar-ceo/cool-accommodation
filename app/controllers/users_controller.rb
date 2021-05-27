class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def profile_pic
    user = User.find_by(id: params[:id])

    if user&.profile_pic&.attached?
      redirect_to rails_blob_url(user.profile_pic)
    else
      render json: { error: 'Image not found' }, status: :not_found
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      exp = Time.now.to_i + 86_400
      payload = { "iss": 'https://cool-accommodation-backend.herokuapp.com/',
                  "exp": exp,
                  "aud": '238d4793-70de-4183-9707-48ed8ecd19d9',
                  "sub": '19016b73-3ffa-4b26-80d8-aa9287738677',
                  "email": @user.email,
                  "id": @user.id }
      hmac_secret = 'descholar'
      @token = JWT.encode payload, hmac_secret, 'HS256'

      render json: @token, status: :created, location: @token
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :password, :email, :admin_role, :user_role, :profile_pic)
  end
end
