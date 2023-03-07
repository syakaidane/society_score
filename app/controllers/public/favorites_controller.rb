class Public::FavoritesController < ApplicationController
  
  def create
    @score_favorite = Favorite.new(customer_id: current_customer.id, score_id: params[:score_id])
    @score_favorite.save
    redirect_to favorites_path
  end
  
  def destroy
    @score_favorite = Favorite.find_by(customer_id: current_customer.id, score_id: params[:score_id])
    @score_favorite.destroy
    redirect_to favorites_path
  end
  
  def index
    @customer = current_customer
    favorites= Favorite.where(customer_id: @customer.id).pluck(:score_id)
    @favorite_scores = Score.find(favorites)
    @genres = Genre.all
  end
  
end
