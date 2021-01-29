class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :respond_custom_message

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def respond_custom_message
    unless user_signed_in?
      render json: { 'message' => "Go to #{new_user_session_url} to login first" },
             status: :unauthorized
    end
  end
end
