class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[show update destroy]
  before_action :verify_login

  # GET /favourites
  def index
    curr_user_favorites = Favourite.where(user_id: params[:user_id]).order(created_at: :desc)
    all_favourites_accommodations = []
    return render json: { error: 'No favourites accommodations were found' } if curr_user_favorites.size.zero?

    counter = 0
    while counter < curr_user_favorites.size
      fav_hash = {}
      fav_hash['favourite_accommodation'] = curr_user_favorites[counter].accommodation
      all_favourites_accommodations << fav_hash
      counter += 1
    end
    result_to_render = all_favourites_accommodations.to_s.gsub('=>',':')
    render json: { my_favourites: result_to_render }
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
end
