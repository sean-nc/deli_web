class WinesController < ApplicationController
  before_action :is_user?

  def index
    @wines = Wine.all
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      flash[:notice] = "Wine was successfully updated."
      redirect_to wines_path
    else
      render :new
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    flash[:notice] = "Wine was successfully destroyed."
    redirect_to wines_path
  end

  private
    def wine_params
      params.require(:wine).permit(:name)
    end
end