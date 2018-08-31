class RegionsController < ApplicationController
  before_action :is_user?

  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      flash[:notice] = "Region was successfully updated."
      redirect_to regions_path
    else
      render :new
    end
  end

  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    flash[:notice] = "Region was successfully destroyed."
    redirect_to regions_path
  end

  private
    def region_params
      params.require(:region).permit(:name)
    end
end
