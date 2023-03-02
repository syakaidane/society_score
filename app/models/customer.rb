class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_scores
  has_many :orders
  has_many :favorites
  has_many :requests
  
  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :kana_last
    validates :kana_first
    validates :post_code
    validates :address
    validates :telephone
    validates :email
  end
  
end
