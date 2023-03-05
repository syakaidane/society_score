class SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    @scores = Score.looks(params[:search], params[:word])
  end
  
  def index
    @genres = Genre.all
    @range = params[:range]
    @scores = Score.looks(params[:search], params[:word]).page(params[:page]).per(8)
  end
  
end
