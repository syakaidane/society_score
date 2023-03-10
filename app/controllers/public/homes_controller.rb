class Public::HomesController < ApplicationController

  def top
    @genres = Genre.all
  end

  def about
    @genres = Genre.all
  end

  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "ゲスト"
      customer.first_name = "ユーザー"
      customer.kana_last = "ゲスト"
      customer.kana_first = "ユーザー"
      customer.post_code = "1000000"
      customer.address = "ゲスト"
      customer.telephone = "00000000000"
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
