class Public::ScoresController < ApplicationController
  def index
    @scores = Score.page(params[:page]).per(8)
    @genres = Genre.all
      if params[:genre_id].present?
        @genre = Genre.find(params[:genre_id])
        @scores = @genre.scores.page(params[:page]).per(8)
      end
  end

  def show
    @score = Score.find(params[:id])
    @genres = Genre.all
      if params[:genre_id].present?
        @genre = Genre.find(params[:genre_id])
        @scores = @genre.scores.page(params[:page]).per(8)
      end
  end
end
