class Public::CartScoresController < ApplicationController
  
  def index
    @cart_scores = CartScore.all
  end
  
  def create
    @cart_score = CartScore.new(cart_score_params)
    @cart_score.customer_id = current_customer.id
    @cart_score.save!
    @cart_scores = CartScore.all
    redirect_to cart_scores_path
  end
  
  def update
    @cart_score = CartScore.find(params[:id])
    @cart_score.update(cart_score_params)
    @cart_scores = CartScore.all
    redirect_to cart_scores_path
  end
  
  def destroy
    @cart_score = CartScore.find(params[:id])
    @cart_score.destroy
    @cart_scores = CartScore.all
    redirect_to cart_scores_path
  end
  
  def destroy_all
    CartScore.destroy_all
    redirect_to cart_scores_path
  end
  
  private
  
  def cart_score_params
    params.require(:cart_score).permit(:score_id, :without_tax)
  end
end
