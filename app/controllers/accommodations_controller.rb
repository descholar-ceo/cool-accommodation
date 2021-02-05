class AccommodationsController < ApplicationController
  before_action :verify_login
  before_action :set_accommodation, only: %i[show update destroy]

  # GET /accommodations
  def index
    @accommodations = Accommodation.all

    render json: @accommodations
  end

  # GET /accommodations/1
  def show
    render json: @accommodation
  end


  def accommodation_pic
    accommodation = Accommodation.find_by(id: params[:id])
  
    if accommodation&.accommodation_pic&.attached?
      redirect_to rails_blob_url(accommodation.accommodation_pic)
    else
      render json: {error: 'Image not found'}, status: :not_found
    end
  end

  # POST /accommodations
  def create
    @accommodation = Accommodation.new(accommodation_params)

    if @accommodation.save
      render json: @accommodation, status: :created, location: @accommodation
    else
      render json: @accommodation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accommodations/1
  def update
    if @accommodation.update(accommodation_params)
      render json: @accommodation
    else
      render json: @accommodation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accommodations/1
  def destroy
    @accommodation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def accommodation_params
    params.require(:accommodation).permit(:name, :price, :city, :description, :user_id, :rooms)
  end

  # Verify if a user is logged in
  def verify_login
    token = request.headers["HTTP_AUTHORIZATION"]
    hmac_secret = 'descholar'
    expected_iss = 'https://cool-accommodation-backend.herokuapp.com/'
    expected_aud =  '238d4793-70de-4183-9707-48ed8ecd19d9'

    return render json: { error: 'login first token is missing' }, status: :forbidden unless token

    token.gsub! 'Bearer ', ''
    begin
      decoded_token = JWT.decode token, hmac_secret, true, { verify_iss: true, iss: expected_iss, verify_aud: true, aud: expected_aud, algorithm: 'HS256' }
      puts "The decoded token #{decoded_token}"
    rescue JWT::DecodeError
      return render json: { error: 'login first, something wrong happened with your credentials' }, status: :forbidden unless token
    end
  end
end
