class ApplicationController < ActionController::API
  before_action :respond_custom_message

  private
  def respond_custom_message
    render json: { "message" => "Go to #{new_user_session_url} to login first" }, status: :unauthorized unless user_signed_in?
  end
end
