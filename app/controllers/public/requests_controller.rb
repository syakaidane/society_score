class Public::RequestsController < ApplicationController
  
  def new
    @request = Request.new
  end
  
  def create
    @request = Request.new(request_params)
    @request.customer_id = current_customer.id
    if @request.save
      redirect_to requests_path, notice: "リクエストを登録しました。"
    else
      render :new
    end
  end

  def index
    @requests = Request.page(params[:page]).per(10).order(created_at: "DESC")
    @genres = Genre.all
  end

  def edit
    @request = Request.find(params[:id])
  end
  
  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to requests_path
    else
      render "edit"
    end
  end
  
  def destroy
    request = Request.find(params[:id])
    request.destroy
    redirect_to requests_path
  end
  
  private
  
  def request_params
    params.require(:request).permit(:customer_id, :title, :body)
  end
  
end
