class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @cart_scores = current_customer.cart_scores.all
  end

  def confirm
    @cart_scores = current_customer.cart_scores.all
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_scores = current_customer.cart_scores

      @cart_scores.each do |cart_score|
        @order_detail = @order.order_details.new
        @order_detail.order_id = @order.id
        @order_detail.score_id = cart_score.score_id
        @order_detail.price = cart_score.score.with_tax

        @order_detail.save
      end

      @cart_scores.destroy_all
      redirect_to orders_complete_path
    else
      render :new
    end
  end

  def complete
    @genres = Genre.all
  end
  
  def index
    @orders = current_customer.orders.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_lists = @order.order_details
    
  end
  
  private

  def order_params
    params.require(:order).permit(:payment_method,:customer_id,:total)
  end
end
