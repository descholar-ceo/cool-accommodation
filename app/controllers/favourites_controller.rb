class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[show update destroy]
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
    @favourite = Favourite.new(favourite_params)

    if @favourite.save
      @all_my_favourites = Favourite.where(user_id: params[:user_id]).order(created_at: :desc)
      render json: @all_my_favourites, status: :created, location: @all_my_favourites
    else
      render json: @favourite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favourites/1
  def destroy
    @favourite.destroy
    @all_my_favourites = Favourite.where(user_id: params[:user_id]).order(created_at: :desc)
    puts "the passed user_id is : #{params[:user_id]}"
    render json: @all_my_favourites, status: :ok, location: @all_my_favourites
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
end
