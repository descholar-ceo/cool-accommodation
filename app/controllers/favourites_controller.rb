class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[show update]
  before_action :verify_login

  # GET /favourites
  def index
    @curr_user_favorites = Favourite.where(user_id: params[:user_id]).order(created_at: :desc)
    render json: @curr_user_favorites
  end

  # GET /favourites/1
  def show
    render json: @favourite
  end

  # POST /favourites
  def create
    @favourite = Favourite.new
    @favourite.user_id = params[:user_id]
    @favourite.accommodation_id = params[:favourite][:accomodation_id]

    if @favourite.save
      @curr_user_favorites = Favourite.where(user_id: params[:user_id]).order(created_at: :desc)
      render json: @curr_user_favorites
    else
      render json: @favourite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favourites/1
  def destroy
    @favourite = Favourite.find_by(accommodation_id: params[:favourite_id])
    @favourite.destroy
    @curr_user_favorites = Favourite.where(user_id: params[:user_id]).order(created_at: :desc)
    render json: @curr_user_favorites
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_favourite
    @favourite = Favourite.find(params[:id])
  end
end
