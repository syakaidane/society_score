class Admin::ScoresController < ApplicationController
  def new
    @score = Score.new
    @genre = Genre.all
  end
  
  def create
    @score = Score.new(score_params)
    if @score.save
      redirect_to admin_path, notice: "楽譜を登録しました。"
    else
      render :new
    end
  end

  def index
    @scores = Score.page(params[:page]).per(20)
    @genres = Genre.all
  end

  def show
    @score = Score.find(params[:id])
    @genres = Genre.all
  end

  def edit
    @score = Score.find(params[:id])
  end
  
  def update
    @score = Score.find(params[:id])
    if @score.update(item_params)
      redirect_to admin_score_path(@score.id)
    else
      render "edit"
    end
  end
  
  def destroy
    score = Score.find(params[:id])
    score.destroy
    redirect_to '/admin'
  end
  
  private
  
  def score_params
    params.require(:score).permit(:score_image, :genre_id, :score_name, :artist_name, :composer, :arranger, :grade, :score, :file_format, :page, :score_caption, :without_tax)
  end
  
end
