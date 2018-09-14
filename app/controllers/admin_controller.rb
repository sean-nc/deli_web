class AdminController < ApplicationController
	before_action :is_user?

  def index
  	@expiring_cheeses = Cheese.where(expires_on: 2.weeks.ago..2.weeks.from_now).order(expires_on: :asc)
  	@order_cheeses = Cheese.where("in_stock <= stock_goal").order("in_stock - stock_goal")
  end

  def categories
  end

  def orders
  	@cheese_orders = CheeseOrder.all.order(created_at: :desc)
  end
end
