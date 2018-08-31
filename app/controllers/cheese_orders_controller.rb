class CheeseOrdersController < ApplicationController
  before_action :is_user?

  def index
    cheese = Cheese.friendly.find(params[:id])
    @orders = cheese.orders
  end

  def new
    cheese = Cheese.friendly.find(params[:id])
    @order = cheese.orders.build
  end

  def create
    cheese = Cheese.friendly.find(params[:id])
    @order = cheese.orders.build(cheese_order_params)
    if @order.save
      redirect_to @order.cheese
      flash[:notice] = 'Order was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @order = CheeseOrder.find(params[:id])
    @order.destroy
    redirect_to @order.cheese
    flash[:notice] = 'Order was successfully destroyed.'
  end

  private
    def cheese_order_params
      params.require(:cheese_order).permit(:cheese_id, :current_units, :ordered_units)
    end
end
