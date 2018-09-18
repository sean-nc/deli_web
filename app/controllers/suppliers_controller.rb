class SuppliersController < ApplicationController
  before_action :is_user?
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  def index
    @suppliers = Supplier.all
  end

  def show
    @pending_orders = @supplier.cheese_orders.where(received: false).order(created_at: :asc)
  end

  def new
    @supplier = Supplier.new
  end

  def edit
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to @supplier
      flash[:notice] = 'Supplier was successfully created.'
    else
      render :new
    end
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier
      flash[:notice] = 'Supplier was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @supplier.destroy
    redirect_to suppliers_path
    flash[:notice] = 'Supplier was successfully destroyed.'
  end

  private
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:company_name, :name, :email, :phone_number)
    end
end
