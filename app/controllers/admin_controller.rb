class AdminController < ApplicationController
	before_action :is_user?

  def index
  	@orders = CheeseOrder.all
  end

  def categories
  end

  def orders
  end
end
