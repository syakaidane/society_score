class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order.page(params[:page]).per(10).order(created_at: "DESC")
  end
  
  def show
    @order = Order.find(params[:id])
  end
end
