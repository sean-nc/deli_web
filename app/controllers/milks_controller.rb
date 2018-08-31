class MilksController < ApplicationController
  before_action :is_user?

  def index
    @milks = Milk.all
  end

  def new
    @milk = Milk.new
  end

  def create
    @milk = Milk.new(milk_params)
    if @milk.save
      flash[:notice] = "Milk was successfully updated."
      redirect_to milks_path
    else
      render :new
    end
  end

  def destroy
    @milk = Milk.find(params[:id])
    @milk.destroy
    flash[:notice] = "Milk was successfully destroyed."
    redirect_to milks_path
  end

  private
    def milk_params
      params.require(:milk).permit(:name)
    end
end