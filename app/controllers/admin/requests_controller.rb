class Admin::RequestsController < ApplicationController
  before_action :authenticate_admin!
  
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
      redirect_to admin_requests_path
    else
      render "edit"
    end
  end
  
  private
  
  def request_params
    params.require(:request).permit(:customer_id, :title, :body)
  end
  
end
