class Admin::ScoresController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @score = Score.new
    @genre = Genre.all
  end
  
  def create
    @score = Score.new(score_params)
  
      url = params[:score][:youtube_url]
      url = url.last(11)
      @score.youtube_url = url
    
    if @score.save
      redirect_to admin_path, notice: "楽譜を登録しました。"
    else
      render :new
    end
  end

  def index
    @scores = Score.page(params[:page]).per(20).order(created_at: "DESC")
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
    if @score.update(score_params)
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
