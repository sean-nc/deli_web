class StrengthsController < ApplicationController
  before_action :is_user?

  def index
    @strengths = Strength.all
  end

  def new
    @strength = Strength.new
  end

  def create
    @strength = Strength.new(strength_params)
    if @strength.save
      flash[:notice] = "Strength was successfully updated."
      redirect_to strengths_path
    else
      render :new
    end
  end

  def destroy
    @strength = Strength.find(params[:id])
    @strength.destroy
    flash[:notice] = "Strength was successfully destroyed."
    redirect_to strengths_path
  end

  private
    def strength_params
      params.require(:strength).permit(:name)
    end
end