class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy ]

  def index
    @images = Images.all
  end

  def show
    @image = Images.new
  end

  def destroy

  end

  def edit

  end

  def create

  end

  private
  def set_image
    @image = Image.find[params[:id]]
  end

  def image_params
    params.require(:image).permit(:name_string, :picture).merge(user: current_user)
  end
end
