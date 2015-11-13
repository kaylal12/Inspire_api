class ProfilesController < OpenReadController
  before_action :set_profile, only: [:update, :destroy]

  def index
    render json: Profile.all
  end

  def show
    render json: Profile.find(params[:id])
  end

  def create
    @profile = current_user.create_profile(profile_params)

    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def update
    if @profile.update(profile_params)
      head :no_content
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy

    head :no_content
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :description)
  end
end
