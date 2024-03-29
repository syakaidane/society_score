class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.page(params[:page]).per(10).order(created_at: "DESC")
    @genres = Genre.all
  end

  def show
    @customer = Customer.find(params[:id])
    @genres = Genre.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "情報を更新しました。"
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :kana_last, :kana_first, :post_code, :address, :telephone, :is_deleted)
  end
end
