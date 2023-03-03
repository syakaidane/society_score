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
  end

  def show
    @score = Score.find(params[:id])
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
  
private
  
  def score_params
    params.require(:score).permit(:score_image, :genre_id, :score_name, :score_caption, :without_tax, :sale_status)
  end
  
end
