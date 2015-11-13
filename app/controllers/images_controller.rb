class ImagesController < OpenReadController
  before_action :set_image, only: [:update, :destroy]

  def index
    render json: Image.all
  end

  def show
    render json: Image.find(params[:id])
  end

  def create
    @image = current_user.profile.images.build(image_params)

    if @image.save
      render json: @image, status: :created, location: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  def update
    if @image.update(image_params)
      head :no_content
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @image.destroy
  end

  private

  def set_image
    @image = current_user.profile.images.find(params[:id])
  end

  def image_params
    params.require(:images).permit(:caption, :image_post, :profile_id)
  end
end
