class CheeseOrdersController < ApplicationController
  before_action :is_user?

  def index
    cheese = Cheese.friendly.find(params[:id])
    @orders = cheese.orders
  end

  def new
    @cheese = Cheese.friendly.find(params[:id])
    @last_order = @cheese.orders.first
    @order = @cheese.orders.build
  end

  def create
    cheese = Cheese.friendly.find(params[:id])
    @order = cheese.orders.build(cheese_order_params)
    @order.case_price = params[:cheese_order][:case_price].to_f.float_to_i
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
      params.require(:cheese_order).permit(:cheese_id, :supplier_id, :current_units, :cases_ordered, :case_price, :units_per_case, :description)
    end
end
