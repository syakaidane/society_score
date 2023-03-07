class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @genres = Genre.all
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path, notice: "情報を更新しました。"
    else
      render "edit"
    end
  end

  def quit
    @customer = current_customer
  end
  
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)

    reset_session
    # 「reset_session」は全てのsessionを削除します
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end

  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last, :kana_first, :email, :post_code, :address, :telephone)
  end
end
