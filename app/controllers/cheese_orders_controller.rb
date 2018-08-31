class CheeseOrdersController < ApplicationController
  before_action :is_user?

  def index
  end

  def new
  end

  def create
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
  end
end
