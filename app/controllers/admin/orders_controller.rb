class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @orders = Order.page(params[:page]).per(10).order(created_at: "DESC")
    @genres = Genre.all
  end
  
  def show
    @order = Order.find(params[:id])
    @genres = Genre.all
  end
end
