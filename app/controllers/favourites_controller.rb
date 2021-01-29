class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[show update destroy]
  before_action :respond_custom_message, only: %i[show update create destroy]

  # GET /favourites
  def index
    @favourites = Favourite.all

    render json: @favourites
  end

  # GET /favourites/1
  def show
    render json: @favourite
  end

  # POST /favourites
  def create
    @favourite = Favourite.new(favourite_params)

    if @favourite.save
      render json: @favourite, status: :created, location: @favourite
    else
      render json: @favourite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favourites/1
  def update
    if @favourite.update(favourite_params)
      render json: @favourite
    else
      render json: @favourite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favourites/1
  def destroy
    @favourite.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_favourite
    @favourite = Favourite.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def favourite_params
    params.require(:favourite).permit(:user_id, :accommodation_id)
  end

  def respond_custom_message
    unless user_signed_in?
      render json: { 'message' => "Go to #{new_user_session_url} to login first" },
             status: :unauthorized
    end
  end
end
