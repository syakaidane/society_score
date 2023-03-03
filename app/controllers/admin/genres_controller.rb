class Admin::GenresController < ApplicationController
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to request.referer, notice: "ジャンルを作成しました。"
    else
      @genres = Genre.all
      render 'index'
    end
  end
  
  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page]).per(10)
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
      redirect_to admin_genres_path
    else
      @genre = Genre.find(params[:id])
      @genre.update(genre_params)
      render "edit"
    end
  end
  
  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to '/admin/genres'
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
