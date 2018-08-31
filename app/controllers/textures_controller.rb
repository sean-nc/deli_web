class TexturesController < ApplicationController
  before_action :is_user?

  def index
    @textures = Texture.all
  end

  def new
    @texture = Texture.new
  end

  def create
    @texture = Texture.new(texture_params)
    if @texture.save
      flash[:notice] = "Texture was successfully updated."
      redirect_to textures_path
    else
      render :new
    end
  end

  def destroy
    @texture = Texture.find(params[:id])
    @texture.destroy
    flash[:notice] = "Texture was successfully destroyed."
    redirect_to textures_path
  end

  private
    def texture_params
      params.require(:texture).permit(:name)
    end
end