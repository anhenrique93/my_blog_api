class ProfilesController < ApplicationController
  #skip_before_action :authenticate_request
  before_action :set_profile, only: %i[ show update destroy ]
  include JsonHelper

  skip_before_action :authenticate_request, only: [:index, :show]

  # GET /profiles
  def index
    @profiles = Profile.includes(:networks).all

    render json: profile_json(@profiles)
  end

  # GET /profiles/1
  def show
    render json: profile_json(@profile)
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render json: profile_json(@profile), status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      render json: profile_json(@profile)
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :last_name, :email, :image, :pt_description, :en_description, :password)
    end
end
